Return-Path: <linux-watchdog+bounces-335-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AAA812147
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 23:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC63B1F2118C
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 22:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F457FBD6;
	Wed, 13 Dec 2023 22:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy4DkAPN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A1CDB;
	Wed, 13 Dec 2023 14:14:33 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce7632b032so4167454b3a.1;
        Wed, 13 Dec 2023 14:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702505673; x=1703110473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imZLdTnXdyTVKycL6b0+sLjjp1Qyn15Ic3JzkJzKH/4=;
        b=dy4DkAPN8Xw2tSrQ4X8ZZu02A8yRBLHCR8XAkT0VXIoTN9qJEHn2ZZ9WJ+stMymOMX
         likfItxcMYlNBLtDYHnyggIcs73hVjtfQdUWBCzVHmpLQwVCF7zMq/F2exJ/KPjK/6Hl
         jOWcna0WAuaruJYtXBZ7V7FHhqLJ2YHL8rmfnlVxR2O0cINyv0qKmmh5f5zRcaCOVwtT
         gV6iKmj2xsUaQgxa2mVVBzTwk1B5wa7HA3/3bxZ/dY51j8755TAbbyert89Gs+kRiBKa
         eyGHDie+cszDFaUguUGw+Sc6fg4H3gEN4bg4qDWFkjc4Lgsd5/x2JuN5lt7jSs/sDS5l
         RzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702505673; x=1703110473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imZLdTnXdyTVKycL6b0+sLjjp1Qyn15Ic3JzkJzKH/4=;
        b=psWv/dLE4g15kOLw03+N/thJco6TFKRnQN5ic7wFNMgaQlES9g/aIxsKAzNsBlww6+
         VjgccfuorHWHSBk7HG+eqV/jEgLhbdXxQFjAZVQBMQ58M5xGM3FGBPDvaT8rSHXw5bd7
         aXIcTYzVDjSim4AD+RAcP0c5WmACFXmfy4/2nxdJdDEaIX6HDfWuh/JMK/WQZRHL8E/V
         ednGkgn4DhHZgxFa8fXymAWHeAzyYF+Vz3Y0w/PmP8lFX8KHHC7cAyzOKQUxiQiMoOQ3
         jbL6gF+0ybNNG1FoLFCDyieKIr+Ebuz35lAYAVIna47fqPBnDwDeAPbLLtSMTHgjxyxz
         7AQA==
X-Gm-Message-State: AOJu0YzJEcyLpH7fvcQw4DFvAT3o4zgHu57y3G4f2lOnJyzTDHkHunHq
	KhUCDbcTSgffs2DNtJ7q+Ss3pCG7UsU=
X-Google-Smtp-Source: AGHT+IELgdF+Buk0SHSih/1S4KuTS3R93Dky9LtVX74yf32QG19ZjQZtU3BncnkEcVzZGlJXwcAqCw==
X-Received: by 2002:a05:6a00:8606:b0:6ce:2731:7a02 with SMTP id hg6-20020a056a00860600b006ce27317a02mr3287323pfb.56.1702505673273;
        Wed, 13 Dec 2023 14:14:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b006ce3bf7acc7sm10370022pfh.113.2023.12.13.14.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:14:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Dec 2023 14:14:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerry Hoemann <jerry.hoemann@hpe.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] watchdog/hpwdt: Remove unused variable
Message-ID: <1912161e-eb33-47dd-a458-b2c6179fc647@roeck-us.net>
References: <20231213215340.495734-1-jerry.hoemann@hpe.com>
 <20231213215340.495734-4-jerry.hoemann@hpe.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213215340.495734-4-jerry.hoemann@hpe.com>

On Wed, Dec 13, 2023 at 02:53:40PM -0700, Jerry Hoemann wrote:
> Remove the unused variable ilo5.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index d5c0aa3ef069..138dc8d8ca3d 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -33,7 +33,6 @@
>  #define DEFAULT_MARGIN			30
>  #define PRETIMEOUT_SEC			9
>  
> -static bool ilo5;
>  static unsigned int soft_margin = DEFAULT_MARGIN;	/* in seconds */
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static bool pretimeout = IS_ENABLED(CONFIG_HPWDT_NMI_DECODING);
> @@ -360,9 +359,6 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  				pretimeout ? "on" : "off");
>  	dev_info(&dev->dev, "kdumptimeout: %d.\n", kdumptimeout);
>  
> -	if (dev->subsystem_vendor == PCI_VENDOR_ID_HP_3PAR)
> -		ilo5 = true;
> -
>  	return 0;
>  
>  error_wd_register:
> -- 
> 2.41.0
> 

