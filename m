Return-Path: <linux-watchdog+bounces-1528-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E395EF9B
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 13:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33E8CB21526
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 11:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C08878C9C;
	Mon, 26 Aug 2024 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/mflSRf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21DB66C;
	Mon, 26 Aug 2024 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724671097; cv=none; b=c3AiaedH8xvdhcNfSFAAOJlP80BGMIa3kTJhLe94HuCx7+jyzAu8dNiaOuiv7fbgolSEdXmIfmLLVYZDvHr+V5zfjzzW2wcjOrrkdT8oLt9g+yPggw3QaDBQ7x0heYA+Qe5pVdSjFu+31QCFm1KDb9scpWr9CbMZk3nzXonipHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724671097; c=relaxed/simple;
	bh=kTFfLo6tIODAyvOENO2VqiQ9n5ayH3EVx/X5pg70FMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDAz5y6ZjLCi4CVgTQ/fGbk0pNafFPnHnnBy7+sKXbsMi5a6AV6W4cqq9mNl2/4fQWoGdrVlgiA69g4OmJpL23rTF/iQDNsGnwLOUPj8qmoTWYWRvO11xTNfvabWWXGq8vNRBR9CbkrRQ3usmjlO7F2NdhifXfO7UZLJchy3kfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/mflSRf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724671096; x=1756207096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kTFfLo6tIODAyvOENO2VqiQ9n5ayH3EVx/X5pg70FMA=;
  b=J/mflSRfLrMWnPEcOrPH3+nKfloj4z+T489SowRIqiPVPQxIIRoS9/bp
   HyfJibl3IsyZbW2fGEREykip8LOLxE1ctk0XW097UW15YWl5h1lz+aX+/
   HXAw7nAKuk/BWh4Oj7t3yxIVVZzELW1/L4tIcTBGHeI9ZQ7kQkEu0QsYZ
   zUUIIoVOAdcvN11xNEE/dniOO52azpxyJKiXtbfqxooxJrsHsxY1gNgtp
   5/Z+7lO/St2YuTAtE3ZbLpTzBy8UzXhxME+7URIKkb6Qtgo5FI6HXo3K+
   yxoOQ3ffsH8rB1RmR3znD6kOFU2Y9NqAMAFbhOPKhjPHx5GdkqDJmcPto
   A==;
X-CSE-ConnectionGUID: ukI7UraHQZWlBsE41x+nuw==
X-CSE-MsgGUID: 9dbC9UkcSjeVY66EWDda/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26850981"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="26850981"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 04:18:15 -0700
X-CSE-ConnectionGUID: +N4DJMNfR8S4MROy934LWA==
X-CSE-MsgGUID: P7pm5zNjRpOob5mLhis37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93209029"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 04:18:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0B83053C; Mon, 26 Aug 2024 14:18:11 +0300 (EEST)
Date: Mon, 26 Aug 2024 14:18:11 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>,
	Wolfram Sang <wsa@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Subject: Re: [PATCH v1] iTCO_wdt: ignore NMI_NOW bit on register comparison
Message-ID: <20240826111811.GP1532424@black.fi.intel.com>
References: <20240826075303.3964392-1-oocheret@cisco.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240826075303.3964392-1-oocheret@cisco.com>

Hi,

On Mon, Aug 26, 2024 at 12:53:01AM -0700, Oleksandr Ocheretnyi wrote:
> Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
> PCH iTCO") does not ignore NMI_NOW bit on write operation to TCO1_CNT
> register what causes unexpected NMIs due to NMI_NOW bit inversion
> during regular crashkernel's workflow with following logs:
> 
> iTCO_vendor_support: vendor-support=0
> iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
>                                             disabled by hardware/BIOS
> 
> This change clears NMI_NOW bit in the TCO1_CNT register to have no
> effect on NMI_NOW bit inversion what can cause NMI immediately.
> 
> Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> ---
>  drivers/watchdog/iTCO_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 264857d314da..679c115ef7d3 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -224,7 +224,7 @@ static int update_no_reboot_bit_cnt(void *priv, bool set)
>  		val |= BIT(0);
>  	else
>  		val &= ~BIT(0);
> -	outw(val, TCO1_CNT(p));
> +	outw(val & ~BIT(8), TCO1_CNT(p));

I suggest adding some #define for the magical number 8 so that it is
easier for anyone looking at this driver to figure out what it is doing.

Otherwise looks good to me, thanks!

>  	newval = inw(TCO1_CNT(p));
>  
>  	/* make sure the update is successful */
> -- 
> 2.39.3

