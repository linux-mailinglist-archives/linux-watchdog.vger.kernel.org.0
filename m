Return-Path: <linux-watchdog+bounces-2072-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD798C5B3
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 20:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E129AB21F47
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 18:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296C91CC176;
	Tue,  1 Oct 2024 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fbyh1WRY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485961C8FB3
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Oct 2024 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808759; cv=none; b=TDC2UsrOa/DMo54TnSNhjYLlFORje7euGBUZfup+AodLjNYgsgL84eAnC1cGAwxewo7gnpD1I6whB8LDWdBXdXd5UGUlgMemG/ak3BUVD9u+YcWfobjxEi7h3/XU33YIsH6j1Z6OfNmd3a9UD/VBxUBon7ro1SXucRPLCBQrBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808759; c=relaxed/simple;
	bh=sD8E4e+PPFfoPemdrxEApnMQulCxcLHme5ymLS77OkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSWG3Ee1RPWEMbj3HkUwDmkIAm28VFDqT8/2zM9k1mgbNHZQVwZG95WiyVol5qGwW6SINewr4UTPr72wZK0WwGjEhnuzzKNpJu3L8+OoR87MNzBE15B2Hw1RXF3xfXodBlA/ujvtxLTSh9QEWX88oZcWdoEeS5UIl4qgLs/vgl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fbyh1WRY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53988c54ec8so5081131e87.0
        for <linux-watchdog@vger.kernel.org>; Tue, 01 Oct 2024 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727808755; x=1728413555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sD8E4e+PPFfoPemdrxEApnMQulCxcLHme5ymLS77OkM=;
        b=fbyh1WRYT5iKrurPqvG/zXCY4YTt4zA5d2I4oQrAgnycvOSuoNcALMcWNCyDkgRr9C
         OJSrgyvUwHy7gH/3UzwHZ4dAEI1DbgdnTdR/gg1xmSIrCnsoAORTNRBh/JfJgctnQOQ0
         5WFTSiTYJD3dgsAE9Z9xRRDNtWw7XL/iTR5fOZBNdEVIZNkf01duKbc77I+yclER8Wm8
         s1k+MIYn39e45qrZImZzpnWd2nkYc1dcbACAW/PVCkPCv3vjuQCFsBtYtcGvW1Y5WfxA
         XtVCBhXunuyBZh1I70LvzmwEFbszDFtjM2CJj5YRovdLtR5JQAx0DZ8rPCmnTn2iidMU
         l0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727808755; x=1728413555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sD8E4e+PPFfoPemdrxEApnMQulCxcLHme5ymLS77OkM=;
        b=KyYY3/hQTrUZADKsd5hUgu1d6uRQs9CM1V/gN/mFkgDZVpdXcduFhYjGJues8EXW0a
         NMorp/V7HjHIyRXXxDkcLPP3QAE3cQedPxZs8Zc3XEYzk2PqXl9TuQAUcPcbdrWqm3nR
         tcR9HeV9aAPGrTBX9V5m1TPSjxLBJOLoZWvuDHaRaaLvP9gi+cwxDkSZxa2Xbs6KDISh
         M2yKijR0DuzEX87EiSciqoB3wU8Cw/byXPeCfwcES19F08tT5bq5a1tgYgSPKGKwgWFC
         lcU91XHv2CIOA0kF+Ad1/OMhuYXkJa4Qx4hRGAZxT1zS5aKGnoaD+StkMWxLiHgNEgvV
         5A4A==
X-Forwarded-Encrypted: i=1; AJvYcCWHKOETd2UDUg4TMUBKye7cw6+RCzpEDJSPU4x4bigLEjHfb1soFn6ApOs3uxBwUsNiopqxHUxD0menhw1KYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/vZISc0i/Z9b5cBk3OR/sOSM/Hzxab4TZbyLWL337dSRsCFG
	tbq/s3VTao7l2yRshiwXfSsUwhOJopRfSoD2blbBddyOzayWDJ5BnLLhGQYDA7BVkdaKiClDha8
	aCA8UBtfmDqy13rUZzEKIKe9Xk+iLxQd1C8BSpw==
X-Google-Smtp-Source: AGHT+IG41sCRZbM6//whDIpTonuwAIsnbWZRJaaYzsvm+L+r9ge26qwBfuwOHKSHxHakYmEWv1+JQdqE3PMHOMQu+pA=
X-Received: by 2002:a05:6512:3a96:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-539a066336fmr236090e87.14.1727808755057; Tue, 01 Oct 2024
 11:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com> <20241001-congatec-board-controller-v3-2-39ceceed5c47@bootlin.com>
In-Reply-To: <20241001-congatec-board-controller-v3-2-39ceceed5c47@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Oct 2024 20:52:23 +0200
Message-ID: <CAMRc=MdGYUt25kE+rVHvKhgLw97aS7KDLHRXv9M+G5sz_qqYZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio: Congatec Board Controller gpio driver
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:54=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add gpio support for the Congatec Board Controller.
> This Board Controller has 14 GPIO pins.
>
> The driver is probed by the Congatec Board Controller MFD driver.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

