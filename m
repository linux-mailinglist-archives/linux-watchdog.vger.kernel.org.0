Return-Path: <linux-watchdog+bounces-307-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB681154D
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 15:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470751C2106D
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669792EB09;
	Wed, 13 Dec 2023 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPfOTNQt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C57AFE
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:36 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6d9da137748so3029851a34.1
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702479275; x=1703084075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLQUukkyD2b7MQ00UNTY2YVMJYcQzYoww54+fthbSX8=;
        b=SPfOTNQtW4wry9cYJbs6bEje9pvlvincsEwqU0TQZktZo0xVr9/qR3XX8ySsn2MV1o
         ziUIgkdKHOEecvY6JksEM3VBTvoh83+cNrlKO8bIy1gvOpByNWDF5hG7rUyCDPB7egBj
         d7uMNhRuwxapf8FCfB6Q1ghT/OyeZMZoYgaFDyh/xX4xQhBq66ABI+KzKKAERFURtt5f
         lmpJ0kTH+m0tdbRlYC0B5VAhdxhONsVAiPStd+S056l5mdh4rqzF0kaYcUO0DDDAs/VA
         VqzvAhFjdfmAlEm0fRHXkdYXCNWZmHvl/LOyqxHzKjaCasoX+L3buRpdicgpk3j9iCgT
         a1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479275; x=1703084075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLQUukkyD2b7MQ00UNTY2YVMJYcQzYoww54+fthbSX8=;
        b=qhlEvSZWXTVacP5TXPv441m5APo2JToEWcxtXAhHiY9wWuz52ie4CuDeKHNxl62E5M
         e5+a9vuXx2x7mm9Gp7yp0+MeQslXPPlDxIno4evJJnKdU+krqfwY/stOCkjGWm50r9iG
         NRKbxy5gWYjNuK7zHtZK90tgRAVFC0dYggRYijrcUhKf820GGAZ4aZJJqRrw5kzIKl1r
         9pXSyO7alEPeGVr3dZ0+loLB87iCll85aYOv08Z1NAn5n5PucsdyNjGYcs/JypMFhqfq
         ivalN8XEJfMLw2ItdxBsnvz0q5B/9N22/AU1R0UeVCb9ToDrXUUTLNocUfZhazZyD6Dq
         F+BA==
X-Gm-Message-State: AOJu0Yy2xlHBJvBXmEkVSWLTxfV3VRX6nBI+HMh7n8EvOt6OGgtbD0DO
	vzLLIcGF+CFBvZFod4319D8=
X-Google-Smtp-Source: AGHT+IFrS9pPSdRAz6Ei0j3vLJij8vEwGU1aBjVPcq4CEyjlvAsZ81wgmRSz03ZvYK9jXOuLtyLzag==
X-Received: by 2002:a9d:7093:0:b0:6d8:7592:9d53 with SMTP id l19-20020a9d7093000000b006d875929d53mr4505520otj.30.1702479275503;
        Wed, 13 Dec 2023 06:54:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s17-20020a9d7591000000b006d84b3aa650sm2796142otk.73.2023.12.13.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:54:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Dec 2023 06:54:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Werner Fischer <devlists@wefi.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified
 for IT8784/IT8786
Message-ID: <80058559-d489-497c-b07b-ca41d5a950b5@roeck-us.net>
References: <20231213094525.11849-1-devlists@wefi.net>
 <20231213094525.11849-4-devlists@wefi.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213094525.11849-4-devlists@wefi.net>

On Wed, Dec 13, 2023 at 10:45:25AM +0100, Werner Fischer wrote:
> WDTCTRL bit 3 sets the mode choice for the clock input of IT8784/IT8786.
> Some motherboards require this bit to be set to 1 (= PCICLK mode),
> otherwise the watchdog functionality gets broken. The BIOS of those
> motherboards sets WDTCTRL bit 3 already to 1.
> 
> Instead of setting all bits of WDTCTRL to 0 by writing 0x00 to it, keep
> bit 3 of it unchanged for IT8784/IT8786 chips. In this way, bit 3 keeps
> the status as set by the BIOS of the motherboard.
> 
> Watchdog tests have been successful with this patch with the following
> systems:
>   IT8784: Thomas-Krenn LES plus v2 (YANLING YL-KBRL2 V2)
>   IT8786: Thomas-Krenn LES plus v3 (YANLING YL-CLU L2)
>   IT8786: Thomas-Krenn LES network 6L v2 (YANLING YL-CLU6L)
> 
> Link: https://lore.kernel.org/all/140b264d-341f-465b-8715-dacfe84b3f71@roeck-us.net/
> 
> Signed-off-by: Werner Fischer <devlists@wefi.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index f6a344c002af..9297a5891912 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -258,6 +258,7 @@ static struct watchdog_device wdt_dev = {
>  static int __init it87_wdt_init(void)
>  {
>  	u8  chip_rev;
> +	u8 ctrl;
>  	int rc;
>  
>  	rc = superio_enter();
> @@ -316,7 +317,18 @@ static int __init it87_wdt_init(void)
>  
>  	superio_select(GPIO);
>  	superio_outb(WDT_TOV1, WDTCFG);
> -	superio_outb(0x00, WDTCTRL);
> +
> +	switch (chip_type) {
> +	case IT8784_ID:
> +	case IT8786_ID:
> +		ctrl = superio_inb(WDTCTRL);
> +		ctrl &= 0x08;
> +		superio_outb(ctrl, WDTCTRL);
> +		break;
> +	default:
> +		superio_outb(0x00, WDTCTRL);
> +	}
> +
>  	superio_exit();
>  
>  	if (timeout < 1 || timeout > max_units * 60) {
> -- 
> 2.39.2
> 

