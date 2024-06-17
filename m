Return-Path: <linux-watchdog+bounces-1160-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56C90B76F
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2024 19:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7D481F223AD
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2024 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70748121B;
	Mon, 17 Jun 2024 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFlP9bKj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A209168490
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Jun 2024 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643981; cv=none; b=LtX7CIwjfVhtF925qKEP2t1HaOFn5iAtnYuDim7kpJtB1FHOaIceADUzcGMjZ03r3m8vPVQzX1Rkx7F6df8mwnOjEzmXankEe7Cb+otKfhn6gl5nJyTTbY8Xj3m/TnzDs4TXrUXA5IjfniRCuOupDFl690EUbJv/OZ7eFlQqTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643981; c=relaxed/simple;
	bh=sQlxSFm69tgL1D0wHx253TI1FPoUt1zklyHja1gBffU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnMldqpnGeDk1KHRc4j3wy6woJh007VKzDQQU9KJs1e3jstW4V1vI4i1HRXMja4vwpR+15SS/uNG03gBUPUraQzLfaYCs7zNP3tG6XAoYFxmxW/Wf/mnYuX0ublgFg77E1wiIv2IQIrdn24iW6NPPv+2Q0YTTImAbhUihFEIv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFlP9bKj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so2744460a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Jun 2024 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718643980; x=1719248780; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EczmAfnm0zuLVuHzlPWL4uafz4PYEM39qm04nV00bzw=;
        b=DFlP9bKjUadaB0G4KiLyR3mnZ1ZLLZCEyIsObDofQMCV9pK7CVLgq2JINyDSubTmqM
         tC/eHrhl0g3bUOuF2urcuOHmOJylGiA9Ptja9MCFvTIY3lj6+2Slb11GSLsejUaSg9wR
         tj1qzJlGXy2oVu4BpjMQ9Hv7O5SxIL+Rp9qgjXdFRwtqV7/h0nkUiI3hBywnxXw8XKqR
         +mFpDewgE09t1+XMJUJPv3tJoE19EHSxmpEm+y39+5cPSIvMKKlyYBQePdl59AkR3GCB
         OGnPCpEf8IOVkv2KZQ8Z0l4jgLDiAEbUD/XjtXDqtzZs1R2CgWX8qFGGKbbOeY6EKHtJ
         BJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643980; x=1719248780;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EczmAfnm0zuLVuHzlPWL4uafz4PYEM39qm04nV00bzw=;
        b=SaQVANAUHFw49/gG5b13ZV4SWF/+ax7m0gavXqCA/KGfGtoEqhqZEOhqpVTULNubjA
         PzDtuRfGELwdfDhnYeP8EXRhbevOqQjXzU2am0Yh9M+3v22aNmV57lbKyFPx+jd5OIxA
         ahOEs1O3DTAAv2DWH2lDG/TKirxoMaSTbr4an/WYto0QQ5LKQuNxCpilPHm00XRFAydP
         JJeW4Ct1YdA+JcIc8BYEzJVn+xg0VceYaeDeIGaHoBqZ+ztBh154n8Gm1zVBDpzj2/FH
         fxsFUANu6rM6634QJXV5MKZ+SRBNOIKrXfvJXSSqU1X4lp0NEhWwniPLX2E277ftlnT3
         ko+A==
X-Forwarded-Encrypted: i=1; AJvYcCXWFrlvMkrdHPTeu1AkJoL2fByY7XOYFleRyy6TYg2DovJqNW0cx2I4O+qnjvs9A8EzZD9sposSbXjYomSD0omQFU9AF5+xbWxsrXtetSw=
X-Gm-Message-State: AOJu0Yy/LGTFF4NHrbafv5urvWTILu4eNFdUflss83jkrt7WqDhuD9ek
	EsUEZiDrXVp3tiT1J8IACNJ7SaW/bjlYDjqJafZVsujySPkWuNPf
X-Google-Smtp-Source: AGHT+IHGS8P4QU3XFck9o0Ve/sab2MYtYJ+R15PcJBebEYsIbvz6fWPGrKuqMFI2Ju2LMrPTRAbHFA==
X-Received: by 2002:a17:903:1c8:b0:1f7:1730:b456 with SMTP id d9443c01a7336-1f862a0cca5mr123594155ad.57.1718643979424;
        Mon, 17 Jun 2024 10:06:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f497a1sm81053335ad.283.2024.06.17.10.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 10:06:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Jun 2024 10:06:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v12 5/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <e61e956e-d19e-4a08-a7a0-07ca29fa5fed@roeck-us.net>
References: <20240617152606.26191-1-kabel@kernel.org>
 <20240617152606.26191-6-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617152606.26191-6-kabel@kernel.org>

On Mon, Jun 17, 2024 at 05:26:03PM +0200, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---
[ ... ]

> +static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +	u16 timeleft;
> +	int err;
> +
> +	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_WDT_TIMELEFT,
> +				 &timeleft);
> +	if (err) {
> +		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
> +			err);

If that ever happens, it is likely going to be persistent, and will clog
the kernel log. But then I figure it is not really worth arguing about, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

