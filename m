Return-Path: <linux-watchdog+bounces-4014-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1DDB2BE11
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 11:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 600091BC2254
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 09:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380BA31CA53;
	Tue, 19 Aug 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZruq3oV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6131AF01;
	Tue, 19 Aug 2025 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597107; cv=none; b=ZiJBem+Z9BUg+06OnOmXPVpTA1qL04S1hsB+NmG9fIyd5KbYlNf23fH03MDdwwfbOgva/ozLcKp52p+UytnDh32a+ZbvgHocuq+DNmrpTEcD8MJzgvhILmrCJTu/QmLdJ/ehL7qLarOyA/du7BvfGJi2ODxEk0R/u0rdarnfeGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597107; c=relaxed/simple;
	bh=zAEE6PZmXVlAjr1qANkvoRFgZ0C3gmkOIMFOBCdWG5o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d1oJMRgl0+x7IBq9pj6+Q+f1L6mwQH9QFwC8Lx7v9JVdgJczf+/N2S0cNN1ZsmQG84RW5DpAko6DVCaKH6nFKWlu+UI1ZHQgkuTDilvPiXk0fZhtOHiQFwLpZl34MhA3bIgxZa+RH3sulUIlB+Tycx0X+dp7n9PFrEBGi9Omfqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZruq3oV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755597105; x=1787133105;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zAEE6PZmXVlAjr1qANkvoRFgZ0C3gmkOIMFOBCdWG5o=;
  b=NZruq3oVgCCQ9d3QA7X7JoSLgeLSGIHAk3UEQk3OLJRLT/NQJyJZlwrM
   huj/3d7HfBqAvlvT/hqmD/lmpVTIvxjZ0Y0tX+PA9mSFny5ZSFan+3tJf
   AqhIbxnrc30UA3SflVSov++UHkM0JuCIU+fMGLjWVrA7+qvZ3QFBnHyi9
   Pvc835oxvp0azwuvXEHLw4iKbSmSKUJo9/iiQPJj2o3QGqV+mcr2i3B0L
   OplX8UiU4B2fy45a/VoPio5od7BxKg977Thstzf6Kt0TeA4tn5j/J8RLT
   ZNoIWlVhIXlI2BOVL1/3NPV4Kf/J9hAYjcnFjr1w+Zy9XsQy48JFCq5nk
   A==;
X-CSE-ConnectionGUID: 9otPXgPaS/GdSw/bMZ+IcA==
X-CSE-MsgGUID: RAy4n2qlTrm1Cm9OjDQO4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45409206"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="45409206"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:51:44 -0700
X-CSE-ConnectionGUID: /jbhT4oYQ6GmqD+2nuhHrQ==
X-CSE-MsgGUID: CvRcmYYNQsejpPuBuM2ziQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="173036722"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:51:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 12:51:39 +0300 (EEST)
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
cc: Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com, linux@roeck-us.net, 
    wim@linux-watchdog.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    linux-watchdog@vger.kernel.org, jay.chen@canonical.com
Subject: Re: [PATCH v3 1/2] platform/x86: portwell-ec: Add suspend/resume
 support for watchdog
In-Reply-To: <e11e542b-b630-4f18-8a60-a36fe31c0133@portwell.com.tw>
Message-ID: <6584da3e-fc86-7a47-f783-da77049b2215@linux.intel.com>
References: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw> <e11e542b-b630-4f18-8a60-a36fe31c0133@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Jul 2025, Yen-Chi Huang wrote:

> Portwell EC does not disable the watchdog during suspend. To avoid unwanted
> resets, this patch adds suspend and resume callbacks (pwec_suspend() and
> pwec_resume()) to the driver.
> 
> The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
> it was active before suspend.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
>  drivers/platform/x86/portwell-ec.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> index 3e019c51913e..7f473e3032e2 100644
> --- a/drivers/platform/x86/portwell-ec.c
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -246,11 +246,29 @@ static int pwec_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int pwec_suspend(struct platform_device *pdev, pm_message_t message)
> +{
> +	if (watchdog_active(&ec_wdt_dev))
> +		return pwec_wdt_stop(&ec_wdt_dev);
> +
> +	return 0;
> +}
> +
> +static int pwec_resume(struct platform_device *pdev)
> +{
> +	if (watchdog_active(&ec_wdt_dev))
> +		return pwec_wdt_start(&ec_wdt_dev);
> +
> +	return 0;
> +}
> +
>  static struct platform_driver pwec_driver = {
>  	.driver = {
>  		.name = "portwell-ec",
>  	},
>  	.probe = pwec_probe,
> +	.suspend = pm_ptr(pwec_suspend),
> +	.resume = pm_ptr(pwec_resume),

These are legacy handlers, please use .pm under .driver and the macros to 
create the struct dev_pm_ops.

-- 
 i.


