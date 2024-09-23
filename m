Return-Path: <linux-watchdog+bounces-2017-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8997E8A6
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Sep 2024 11:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C969281690
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Sep 2024 09:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFAE195980;
	Mon, 23 Sep 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBAqoSIx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F016194A68
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Sep 2024 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083689; cv=none; b=km/RzRml6gfZ83hKZ07s+XjVsYL+3sY2FnftBnETym+a23CJoayvfwYXNWFlfJl6EXukiKUJq9n3f9p01P9eygzBufygEZsXfsriXQFU9TkQyxUDdlksNiv5RhZq2DOC1d4jG3IaRE0Tm7HxXelL8YUoXuNv5+AMVKWieVir+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083689; c=relaxed/simple;
	bh=Y2H3lLogo29T09ZIg4O5267APGx1T56CgiRzH2uFGiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ4RHOKuqBmt4qRD7qCWBoWxM6alrjLWE5IY7JKW2SfsQD0dRU9cMuFa6H/abqruh1C6SPCHMdQXp7xejsideo66GZ71tDmV/S/ihQPm6viBpN7z4ulJ75ZPx7IxymDnInBXuqTDXeJrPv5IsG/DNVq+F8s1Dn3wsCpnGUaln9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBAqoSIx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso6212358e87.2
        for <linux-watchdog@vger.kernel.org>; Mon, 23 Sep 2024 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727083686; x=1727688486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2H3lLogo29T09ZIg4O5267APGx1T56CgiRzH2uFGiY=;
        b=RBAqoSIx+RVn8QLjrhgFcTEvyiTWLGut/hdny5rdecWBShI5CYoOtYoyb+Mu/QLt58
         zKkdIKr2KQrBZXg1+yxkSQ9h42jobYliJrNsBifx6q/H8TeCNLQqWOcOmUL8u2qSKIsN
         8sywRZq/Rkvf+gb3AxVYacBLhjcqeexz5IFs6L1aEU0cwr9fj4k7LmmeBUUnOgxRrp4h
         vh0VTUAbPalneuV1+T8yHKardhv/jzSsKGdJQ9DCn42SPiPZtf1w19oy5JUql3ktBGMp
         P+XBkaQUVmIeWOkiEqcPiLnZdiIHLEQe62A8uau7Pu5z6kEtdn3k0JAJhdLhS2hZHxDf
         8YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083686; x=1727688486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2H3lLogo29T09ZIg4O5267APGx1T56CgiRzH2uFGiY=;
        b=sopGJ2IDDRRi8qIzuo6Yx0dARTXRUy+92A7a0V18wey/En6QnbgWJRz+XdqlaOw8Ct
         lwa5fM1AoukgMbnn6p36qff8JMdA/iuIZRGMpnFovJLOtTHKns/N66zm3gzSBMoqa3tY
         u4qOWZXsZdYL23ysaqWUOJgCP69jrpg9Bhgq/yKKZTnOe5nacMt9azcE6YDUorApwlVE
         +ffxuN/KX23gJ+SeWEWMzYasodYQymnhgdNVP04zrsnGP6j2sJ0GBvPWK6bXTI7wL1Kz
         7rQu1EhcfErccV6Um2SmvGhnXsL48C+YX1QFgxpErgXzqFAa0a+vY/TaRo/VvpQU5lTn
         0Hmg==
X-Forwarded-Encrypted: i=1; AJvYcCWt5gG1W7ifOY38oA+6qbSDpY08SSxGrRo9nZdqaEAGUoIsrovsHaTl+7cA2k/y9yehsaHOT1kKc5DVyMg70w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxffKdzaFf+XVSx4hxOMjCKgfpxrpLYqt9zD3PVGMR1vyZioDlb
	ghcoHmec0R9Hk6/22E3rwxWBwaLBl3IB7iqK5MlrjsbWnlKhBNshyeOTx4b8KLsQk+1U2W4YiYD
	aPSUP0mGXaoFBfoyZ7HYx9QIR5YQlrzpdvo7GAw==
X-Google-Smtp-Source: AGHT+IFqcb5VcpmKktw95t64Q/tONZlUY5uMG8agXKVRR1VFK+H/O2baR3jHivWHjY41tZ/ZQZoJrQNpCocxjyIuWM4=
X-Received: by 2002:ac2:4c4d:0:b0:533:45c9:67fe with SMTP id
 2adb3069b0e04-536ac32ef59mr6887747e87.48.1727083685755; Mon, 23 Sep 2024
 02:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
 <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
 <0e3902c9a42b05b0227e767b227624c6fe8fd2bb.camel@maquefel.me> <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
In-Reply-To: <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:27:54 +0200
Message-ID: <CACRpkda7Kef-buHQ3ou3q_xq+OD9-cONh1Ynu-KjvQf=Qx5S_Q@mail.gmail.com>
Subject: Re: [PATCH v12 00/38] ep93xx device tree conversion
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, Aaron Wu <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 5:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> I've merged the series into the for-next branch of the arm-soc
> tree now. The timing isn't great as I was still waiting for
> that final Ack, but it seem better to have it done than to keep
> respinning the series.
>
> I won't send it with the initial pull requests this week
> but hope to send this one once I get beck from LPC, provided
> there are no surprises that require a rebase.

Thanks for picking it up! This is a long awaited patch set.

Yours,
Linus Walleij

