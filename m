Return-Path: <linux-watchdog+bounces-3060-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8560A50F10
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 23:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B33A16A422
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 22:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9ED206F17;
	Wed,  5 Mar 2025 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T9TQvKwL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18CE205AAB
	for <linux-watchdog@vger.kernel.org>; Wed,  5 Mar 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215037; cv=none; b=tAhtq6uZcQG2gtpFoUjcEUfZ7nsxBPShieaQKHCCejJXEILn+t7wuwp6VdGhnAurxXuIZoPynMCvaoSjC8gtW0nJ7YmgzWlBCL1HBOHVC0s6HGuFuRG5tfp+bKlZrwdTk/Lt8HyFx64OiS/3HjcgjDOc3fV+qWBy3QZWquAih+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215037; c=relaxed/simple;
	bh=hINIG5kxOwV7liYzl/+ZFhE/Yh0+VkapvzoZ/yUMGP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IesuoBVhiDj4iZ+OIZuUUG7zAHkUstAh2IsLUvDCus6FkgMK1r7pn3VQ3q/P7ijsmllNagLgT45oi2kkMjdmbAI1ABWHalsuDIcCnMHqmXEPNVUhm04RpX+2aFhyX+VT2wB+xG8c6WHwoUg6eNxBy0oYUdnB84ka6MiUW9SlA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T9TQvKwL; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-474e1b8c935so99011cf.0
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Mar 2025 14:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=T9TQvKwLN2u+9y36lckxvdsuTFx31lvq1x1zggBu878diCilZ7xUW+aqF5EBspIg0A
         HUaVZQAK7KkQx4aRLCsS56FN2fqEvRpI8JhGXQIHDTM7FxQvld3ErSslCA2ebNzk7eGq
         GNqny3TiwsJ+IiVthCaZJMfHX3zKrijEWOXdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=rhempfF1lv51zEo+e7tX/6/GcFCI+h2CwSKRDpYjPpOmNg1emWlN3XlczqSfRDD5py
         DHwqpTNjCiP/Cg/HlgKydyDZRa2mPMzcuNCQaqClp/Vsm90gzWFzaHndRgSbFKOMczVT
         Rr660hKu5HoUrTGCwDmt51lloZOAIjdsmkgLPvnwrySMkyyV2//LHJDp/hV/y2235VHM
         ka/UHqmeClkZ7nBx2LCm0XW6OeXrqz76uEannIe7w1+4ZVkvGbYukx6w4B0D9Iwc8+11
         PadHX6h+4gHJilSdrd4tfaN6R8triOuNFJukn8yi7E8XF3O8qcg2g45ncaOXd/22JRCb
         fVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDJ8UnI/eZE9MeATrUBD2T5CaPHNDKnlC793sZK2eAAb+uk2Y4Q0MMiakFys5nE8Uq2mGBO+U1nKXY9thhwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCg/QKpDyeIN9yyosR/SeiHgDFvzKJb7q5s/foWBZ7+Iwu4CO/
	AxlKfvW+eF53NEyUi4UJwWfHOpJpxvkMiYD3RRHRnHSprSSIQiHEF3zaM73nEarUAOWApnjesjl
	8l3Khu8TfXsy0a4KoDrcr7SA8Gp1SoAx2sEK1
X-Gm-Gg: ASbGncsHyQCsiqITHOD15e0q/X6A6QvwKq8Qn140t4Wha41KtqfDSPwTBhZH1ro8u+Q
	0ql7kk/QOKHoxkCOgwfOoVr587o20A+pxamWpVqAqjaWS0ecaeOU9kBnKYSva2qnD3Tej0IGWy9
	oYBh32EBFuvczT5tVqPoWzkNLJeBrx/ovmxBTysugk/dBMcQVLI5Y4QugLhHE=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org, 
	mazziesaccount@gmail.com, thomas.richard@bootlin.com, lma@chromium.org, 
	bleung@chromium.org, support.opensource@diasemi.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andy@kernel.org, paul@crapouillou.net, alexander.usyskin@intel.com, 
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org, 
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.

