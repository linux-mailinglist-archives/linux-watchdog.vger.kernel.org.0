Return-Path: <linux-watchdog+bounces-304-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90636811548
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 15:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D3D0B20B29
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 14:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062F12EAFC;
	Wed, 13 Dec 2023 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2JuWnxr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB73B0
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:06 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3ba10647a19so2374362b6e.3
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702479245; x=1703084045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NhnebjTHxDEDnEzsp7WDcaAYcIj/SB3E4FD7oRsXwI=;
        b=h2JuWnxrpnREohgNl3l/oW07HkKjyCBMrf5qPvxqJhvA3BtXNCBWSMoQJ8iEjGMhi4
         DmtIbakOro9Cm6dJTsmJldpOsxWii8suzTCKtwFMBu/iK5SJQiYIQ744uyWxsDErfz22
         +FYfcyG5PlrBOnvJTqb0S0zyhymrlkatDQmJtT9XzZJ7nRx7BFtPteYE+kAOkI8i5Gwh
         RwIhvF5gdeN0pPp2APOFqK+JDfcfaFO3v9WzFgRyNMAWZ1OOINsj0b3/K1T2xRybncSs
         WgAFfBrikJTTyaRDobaLtQ10HvwlJIi4u5k1HRQJ/CwvvuWnUGA/4OZocK+cpd0oHtvG
         R2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479245; x=1703084045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NhnebjTHxDEDnEzsp7WDcaAYcIj/SB3E4FD7oRsXwI=;
        b=sT6F6Shvcn+J2/3jFq5XRXMIhTVGehD9NFdsdD0H63B4TbeLFC9R5MwUcFlNMkiznz
         ruooSV/xH3yHwJBr2XXnUEZqoCUFvMpis8NTrT/THea4WpNyY1gboj3D9jafdMPnaUZ8
         r3tGESIkP7wRmgc/F5zYULJL2lLFZSThK57oioIx4qp2l6mpUfAKvi5fgx0eB6LQslwX
         6OWRYpyY1tStfr2Zlb52D+I6kafKTvwPFxC4leDgUTUfqgsh1FM6xwVxVNMyXZmKASud
         onj86lfaZsx6ZJ7T/+D4dpRbqs6Z9Qdk0PZG+8BvSn6vySMr7sd0naZWuDpVUyi9koSS
         YGTQ==
X-Gm-Message-State: AOJu0YwR8vN8H5n8VSblVMqORodE6j+cFXu/jzrc+Z1j946e/L9h/0Ef
	p/73ua3UCeATBZCxEGYl7gBJNSgVK4XPDw==
X-Google-Smtp-Source: AGHT+IGqItC87n9TMQhWK5XiDMnrW5aXUx3COxwY8JD2BxG9LiAwCZmJrTS690oM/o8CuMcSvXvNvg==
X-Received: by 2002:a05:6808:3205:b0:3ba:18f8:7c5a with SMTP id cb5-20020a056808320500b003ba18f87c5amr4437772oib.112.1702479245453;
        Wed, 13 Dec 2023 06:54:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id et22-20020a056808281600b003af56ef1510sm430647oib.20.2023.12.13.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:54:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Dec 2023 06:54:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Werner Fischer <devlists@wefi.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/4] watchdog: it87_wdt: add blank line after variable
 declaration
Message-ID: <853b7398-b9d7-4bde-b69c-7f4f68f472b5@roeck-us.net>
References: <20231213094525.11849-1-devlists@wefi.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213094525.11849-1-devlists@wefi.net>

On Wed, Dec 13, 2023 at 10:45:22AM +0100, Werner Fischer wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Werner Fischer <devlists@wefi.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index e888b1bdd1f2..6b7f7ec03633 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -146,6 +146,7 @@ static inline void superio_outb(int val, int reg)
>  static inline int superio_inw(int reg)
>  {
>  	int val;
> +
>  	outb(reg++, REG);
>  	val = inb(VAL) << 8;
>  	outb(reg, REG);
> -- 
> 2.39.2
> 

