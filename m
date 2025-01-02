Return-Path: <linux-watchdog+bounces-2650-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370F9FFB15
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 16:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15C231623C9
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 15:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEFB1AC884;
	Thu,  2 Jan 2025 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv7KOrb5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76E8BE5;
	Thu,  2 Jan 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735832612; cv=none; b=BEmK+a4JsfnZr1PCpN/Sx7pDxabCd7O8IZ2aqGbbG+45MhzKTVJBukxg4PbVlFoohOgIsn0OePhvwMuR5nTYlBWsuYg08FAS4A+865NsYZPIm7vrjPYfk8HT3EVqntYURgsKlLNYqOZUXhv4IqbDNKK4FJKaVoWw+zb8dlQo1Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735832612; c=relaxed/simple;
	bh=f7eq3l7ZDsyNTY3refR0j8pqg57j1FSI/n8SPokSSvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxYs7+Ua9IJ9bdi6A2gQ8dgfYVIM2OjMP1eP0R32ldCB6rHQ5xkVIfRPgM9fsedzqdpJljAza+IO5oAgw+2w4R+o81lD0w9c8dmqc7w7QZbxVuMTKZbEGb4qUbd64brXx0bx+X7IsXJereFjvIA4KcZuHVdWwU2qtho7cfMp5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dv7KOrb5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216634dd574so104429645ad.2;
        Thu, 02 Jan 2025 07:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735832609; x=1736437409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka0Ha448dVLI190bVSdj/FQv8g+PKNloYfyPDYXLrNI=;
        b=dv7KOrb5IKtVmVeaJ/z5iYRAAZFM1Oavc7BB8yNp7Ri6dAqrRacAU9lO0re4qzI77Y
         bW9Mun7JfIyxGXgemX7GMiAiNJRXsOAzi4sLAqRms2DDlIrjqojH/Xyp2JPazotzCYY0
         kXT/xJH9NtkaZ2ZAOOyDufUo1PBpxc28X+IGhp6qutPemCuBhWHpuZcfuyhdyHEqmVmf
         IWTxRuw6jCui8xENYQ+7D4mfEG8+n5FYeI9qZ/P7YKs4sMwguoPoJyosU2cgkLgyJmMi
         0pZXvQ8GOod44tvMDKWw2kSYy6dNNQ5kljQqJuFq8hyjgxJp55A9hSKn0V1nWHGFyd8E
         IDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735832609; x=1736437409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka0Ha448dVLI190bVSdj/FQv8g+PKNloYfyPDYXLrNI=;
        b=f06zOtlnE1QkNzjoxdg/LbdqjGaCSbIDobW7qmGPlV1G9wKm6ss/Q8AGP1gPrDfF2T
         YiWo1LMQmbfavnKo4611sYBYpy3VL7DQ2IKuDDdKlPLhSrMBEaQkPE3J8Q1am/+s10KK
         qLn0bb/fry6ujpVX3fazVtjCPUYyKeQBQKdXPJB11e4+w5Q9EXEG1hmMrfPCJNp0PYHH
         L9pXkgrNYTIxsf20UWktJe98/+1pnEtR+yiaf/+0uKWNze/16O0um4xQSW2oxkwUSnp4
         WyJjrBpoXgRr9LMXEFg0aS9/qaWT6MfBeVKSQv8cY+BOJaaoavcLCgKYwaDz8fHf7SYE
         BBhA==
X-Forwarded-Encrypted: i=1; AJvYcCVIJQYqkDEvuwXQPCUnoFTWO4hHB6IUHvd59AAkna2UZEEohjj0/0MKKxkX4g7hBY3k8Jc/53pTKK3Ub71tomU=@vger.kernel.org, AJvYcCXOSABjn7tn32H3sVIb44MnZB40gOzVU59O0cvA03o0n9g86dVrNkKpBr0isb9Fb9qRnWMg6nHiyxQyDXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSz8SKFsYONVg9bCgOkoCFC3n5f6Q3TCs1NQq6BlQgKTFp5TYz
	Wfcn2qDA7WTqbCQmdLC+Gp4natOnrBy2Db5Am7m+bW73t7DQYddG
X-Gm-Gg: ASbGncvfOs6Yql59MalknXOrnP3JimGfECCUY/E7Cd/K+OksBtdhDesoEUSSZzt5DOv
	r2ZycwPFcavHNU2yhgSP6XHx2gswEDhnQ42Q+OmFKixIx54XJ8rTSfHSvAPV4L6NvxAPMQunXRz
	DnOaSSM3whVA4a8KiVFeFaB58xR+rDhI0j2l/FyM5zb1kTlyc/0rgTxGa5nAVXdeU+R2Lj9U7xe
	irQHp6pHv+fqls+Vt0rI+lpzqSU57RzmgG7hds5D93ftNf+fd/QJCZoWLLXgIFtCGABbg==
X-Google-Smtp-Source: AGHT+IFfUFAjWdkjgbSefMDbe5m1i4dwq0pp2oVq9PRA7FUnd/su1H/LdjBJpNQEQiQ49P5ny0Jn9A==
X-Received: by 2002:a05:6a20:d795:b0:1e1:ce4e:ff95 with SMTP id adf61e73a8af0-1e5e044b04bmr74799536637.9.1735832609368;
        Thu, 02 Jan 2025 07:43:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72b5bde56f8sm4282420b3a.162.2025.01.02.07.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 07:43:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Jan 2025 07:43:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] watchdog: max77620: fix excess field in kerneldoc
Message-ID: <984cdd73-8799-477f-bd7b-e53dc878f1ab@roeck-us.net>
References: <20241230-max77620_wdt-kerneldoc-fix-v1-1-8a3211818993@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230-max77620_wdt-kerneldoc-fix-v1-1-8a3211818993@bootlin.com>

On Mon, Dec 30, 2024 at 06:35:58PM +0100, Luca Ceresoli wrote:
> The wdt_info does not exist in the struct being documented.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412281555.YMBF9azh-lkp@intel.com/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/max77620_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wdt.c
> index 33835c0b06de573c93737309bd69c7aaab43127e..d3ced783a5f4d554db787a47185c8b7eb7ac85e4 100644
> --- a/drivers/watchdog/max77620_wdt.c
> +++ b/drivers/watchdog/max77620_wdt.c
> @@ -25,7 +25,6 @@ static bool nowayout = WATCHDOG_NOWAYOUT;
>  
>  /**
>   * struct max77620_variant - Data specific to a chip variant
> - * @wdt_info:            watchdog descriptor
>   * @reg_onoff_cnfg2:     ONOFF_CNFG2 register offset
>   * @reg_cnfg_glbl2:      CNFG_GLBL2 register offset
>   * @reg_cnfg_glbl3:      CNFG_GLBL3 register offset
> 
> ---
> base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
> change-id: 20241230-max77620_wdt-kerneldoc-fix-cc129bae0fb7
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

