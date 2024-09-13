Return-Path: <linux-watchdog+bounces-1894-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C1978778
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 20:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FCA5B2422E
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 18:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FF1446AF;
	Fri, 13 Sep 2024 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoOa6PWq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3F8289E
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250763; cv=none; b=sTzVVrys5cQC9ugefxBWAc83nTk40jVtiPrcicJf8keYgQNAjocomJg4pmtW+Z6G6p7+cazqU814xgwK6Dmpu+h9rsTmXZT3HYb6s76xR9vK3SHUO3eRLS4krrSxX5YpKXrxQdELw8N6zLkFxQUzP+NxhbD1DHMmtccXHWAUfm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250763; c=relaxed/simple;
	bh=uUzOaArTXDr8Q4BHw613wQxryb9AGwVyx2DHCAmeodg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6J9lP5WKAn2Svf9A+wG9sISQxKUL4zqrAC1oMo8OQs7LZY0hbLv/jCi+DGxN+Wdal4GJGd93PF//ccNU5GfGecQFIf2/xX4KgOksR+GoqRkg0bFSi4NQ30ijYjFRwGgnDIrc2MlmPtuqQZcDwQ58pbfeli4+KEos9EyXLRDVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoOa6PWq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71798661a52so1899976b3a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726250761; x=1726855561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoW+4E+mGBVCZVOyxk2oN7/GvPki7ySxacqGFxI+gXc=;
        b=AoOa6PWqQp2v3zUdlOJFDxCMw8T5/U9KhDDEOI7JPQ0Mabneh7Mcli+T3ylxY/cQYn
         WayhkGaNqlVfwXiuDFo6Zs02ScaSyUcXXCjY+fvlLFxqcsoSDX13eQeQFz5Gqt0E5HhH
         oX2da96k1CDRvX4lW7KS4sLR4LLoYX3ypLUcz5BFBc0JMIKAPe865IJpHkA2+jOri60b
         ZZdK11cR/Uh8j4MoV31uoUhqyrlakwvOQK0pw8Hxae5TkYI9BYqzkIMXFwFnjc9XPcf5
         Fk9FwUuiNg3UsxOqILQy1Ol37MVS8OojsR5/CRy404k9qAAJpDnO1S+GE9OtM9hlDs3x
         7L9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250761; x=1726855561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoW+4E+mGBVCZVOyxk2oN7/GvPki7ySxacqGFxI+gXc=;
        b=MzfqGikA3JghY0V0dEuMAYpTZjveZgcv1cMqDxwCxBH7SLAl0pZOSpC0tQer48fm/4
         lbHWvBnwcGxJZxiFR7462bErP0rJkz7pcgiinDun4p9epybiZ0h93XNZkWMSlB/xTHYb
         zUp2xz0IXpjrRlBmpBr1Yi1RCQH56o3F6zDHDlOLW6L5GZev7ONott9AQ/Cc2kmTNZUc
         2JZyJ0cpBnE96Uti7dCeeduAc/bvfu31nJm+Gqml9LRK8RJCR/9iWn6VNCaZzlETfcb9
         H3TxnSFrikGNkztjRgYq9VaRiDYo5CGtGVWo7rfbblGtrsX/Hc0bAnWQVovgUdRFHV69
         cKXg==
X-Forwarded-Encrypted: i=1; AJvYcCXvrpVAJBBw0PTpxe0IWCT/aLHCtYTIrLDkrX8+Ea5i+olp5JdHEUrZ8nqEzQ9COOrLllrQ7aPFrziGywgRKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83YhUQAi0YyACVrf1TAdZkpbdMnUYskrQmwZUBd3DVA84jLNH
	0cV8ISN4sOKkXBaeoQ93sIHEgveG5kUpyKCD1QVn6HDriS2mXUbpgIW0LA==
X-Google-Smtp-Source: AGHT+IGrj8JEohC0xsfA91mYBAgELA8fpC/fMJ6IePNYAYI2nHWfmBk5tNHypU714KsA9/El8KlONQ==
X-Received: by 2002:a05:6a00:3d14:b0:70d:2a1b:422c with SMTP id d2e1a72fcca58-719263ea9d0mr11449438b3a.7.1726250760778;
        Fri, 13 Sep 2024 11:06:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe52fcsm6386509b3a.64.2024.09.13.11.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 11:06:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Sep 2024 11:05:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: support.opensource@diasemi.com, linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] watchdog: da9063: Do not use a global variable
Message-ID: <a094303b-5e8a-4b18-af97-f9012bd2bd7a@roeck-us.net>
References: <20240902224504.1012750-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902224504.1012750-1-festevam@gmail.com>

On Mon, Sep 02, 2024 at 07:45:04PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Using the 'use_sw_pm' variable as global is not recommended
> as it prevents multi instances of the driver to run.
> 
> Make it a member of the da9063 structure instead.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/da9063_wdt.c   | 9 +++++----
>  include/linux/mfd/da9063/core.h | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 684667469b10..69f884cf1a7b 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -27,7 +27,6 @@
>   *   others: timeout = 2048 ms * 2^(TWDSCALE-1).
>   */
>  static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
> -static bool use_sw_pm;
>  
>  #define DA9063_TWDSCALE_DISABLE		0
>  #define DA9063_TWDSCALE_MIN		1
> @@ -230,7 +229,7 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  	if (!wdd)
>  		return -ENOMEM;
>  
> -	use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
> +	da9063->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
>  
>  	wdd->info = &da9063_watchdog_info;
>  	wdd->ops = &da9063_watchdog_ops;
> @@ -267,8 +266,9 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  static int __maybe_unused da9063_wdt_suspend(struct device *dev)
>  {
>  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
>  
> -	if (!use_sw_pm)
> +	if (!da9063->use_sw_pm)
>  		return 0;
>  
>  	if (watchdog_active(wdd))
> @@ -280,8 +280,9 @@ static int __maybe_unused da9063_wdt_suspend(struct device *dev)
>  static int __maybe_unused da9063_wdt_resume(struct device *dev)
>  {
>  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
>  
> -	if (!use_sw_pm)
> +	if (!da9063->use_sw_pm)
>  		return 0;
>  
>  	if (watchdog_active(wdd))
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index 8db52324f416..eae82f421414 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -78,6 +78,7 @@ struct da9063 {
>  	enum da9063_type type;
>  	unsigned char	variant_code;
>  	unsigned int	flags;
> +	bool use_sw_pm;
>  
>  	/* Control interface */
>  	struct regmap	*regmap;
> -- 
> 2.34.1
> 
> 

