//
//  JobTableViewCell.swift
//  GitHubJobs
//
//  Created by Phil Cole on 10/1/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit
import AlamofireImage

class JobTableViewCell: UITableViewCell {

	var job:Job! {
		didSet {
			guard let job = job else { return }
			populateInformation(with: job)
		}
	}
	
	
	private lazy var stackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [titleLabel, locationLabel, fullTimeLabel, postedLabel])
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .vertical
		view.spacing = 5
		return view
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var locationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var fullTimeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var postedLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var companyLogoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(companyLogoImageView)
		companyLogoImageView.pinToSuperview(inset: 25)
		contentView.addSubview(stackView)
		stackView.pinToSuperview(inset: 15)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	private func populateInformation(with job:Job) {
		titleLabel.text = job.title
		locationLabel.text = job.location
		fullTimeLabel.text = job.type
		postedLabel.text = job.created_at
		guard let logo = job.company_logo, let logoURL = URL(string: logo) else { return }
		companyLogoImageView.af_setImage(withURL: logoURL)
	}

}
