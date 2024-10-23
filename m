Return-Path: <linux-watchdog+bounces-2272-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908149AC2D9
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Oct 2024 11:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC0B1C24DD0
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Oct 2024 09:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B7018953D;
	Wed, 23 Oct 2024 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bf8WlTYY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA942AD2C
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Oct 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674326; cv=none; b=hF54IzE83Ne7lhmTmBnj66WwM6ocaYpFupQhGQsTI0z2t1c8syKuEMFK5EWklYGfGbvN++2e5GH0j8PyBMuI4rofMGC8JAjAO0jjc2wksTRcm5DMau385k1fomlRkwRnW7tEpO5KIDjID9IBew0Qoxupi24VZ3v8GjBqcpwwzYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674326; c=relaxed/simple;
	bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=di6qqPZ8tNdr4uJ6LVJviaQz0AMAX4jnCJxld5qbiBdH6RzRe4DQANc6m8Yt0qhWGsyP/Vlry/UIUiJZfwrhwHBa8RrMtTDpA0yP0mMHBQp2ey6KTIlXstcgvSIWAkcHQrfu859Q/mBx/zayzqGMqw+awNLBHedxe/PWT8ej8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bf8WlTYY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f6e1f756so7634212e87.0
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Oct 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729674323; x=1730279123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=Bf8WlTYYkazelvOtD4+8fKPxplJyMy/MFUXpwj/wtxRdiA/9k4ANP89QOrXqvKte/r
         VKeoW/ZKUh1Aak3JYBP+PyFsT8nBxeIPCjO8cIiZi8LXjHeu05bDq89k08EMQoSfTzXn
         Gq3cwjaGVuZ7qTp5o3/UWU4vMcm/hSCQupbCQwzYM+nN03VWU+tNNkoNu3xNVg1agQP+
         FoTMO3Pk3xEjhyfJRSsEiEvlQ9FOjPGPF1YhRrpTCHZykO5Qj+By1MwLPds4R5790n/L
         hehWQQTPCFi6YqPR9Hww4hiDuUreSsv4d+kNbmyNWPaSYLdXggrcb46HLZBVCGGUtaeC
         sjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674323; x=1730279123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=HGA3xlDAqHm5vd8Ode17lGJZfwKE8G1Ccvnmz29dF0do9ppnyar7dlP2Icxy1goXe0
         pnkqFXrGZUI7kbiq40xGQv9IjpsYCuqlxgYYYPZnzlX3E27TlQAbb9XXAzksCFwZv68H
         KMH94XTXpF4e2U/WCLcr3hNtPFV0d5N/aBG1mKn26yFFHo1agRFyXl4ZPg+arHFQtbXs
         vkpVwn0k4RBKcXcySzLut+46myAh5JBQBxSvwunL3CiD+qRiSaTw+K2Jmu9ebCyLfebu
         SkCmigt4sUWS5ihCf1TPqiRXIHvJzetVD+SnPll2sf77cCZnb2I4FlfZVwvmAqhB+sS/
         j20Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDZePGQLyzKLD+lPPCrfwiUmsCdmJOBGqYi1D51fkXcZZ2LGOs92ZSSaQaI2Gns5PaQdnxnbI9fXMNmMzvVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgJCFJUaJZC+nGqMDH68w98gDML+ES1aFQIZdGJxhAZy9fKnG
	t6XHmZgfKqjWf11M0lNO2YcPehSQCumw3Okxn/2aWdhwKufyzMzzm63fP1n1+Uq+LgYFGaRtqtk
	j7pRQShwRxdH61k5/3pKZjPlO53C3HIspudVohw==
X-Google-Smtp-Source: AGHT+IH1+v9bDoKekaMKgbzEkbrdYTS5dXGjA0/CBdqgcdFe8CjG21FHGf37DjwlkgqMpl892dYOQgZjGQaLo7ZGFiE=
X-Received: by 2002:a05:6512:3e0a:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b1a2f42ffmr857364e87.8.1729674322600; Wed, 23 Oct 2024
 02:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com>
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:05:10 +0200
Message-ID: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> w=
rote:

> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> iPod touches and Apple TVs.

This is a good and important series. FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are patches not getting applied since you resend them?

Yours,
Linus Walleij

