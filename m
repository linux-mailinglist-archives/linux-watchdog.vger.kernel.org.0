Return-Path: <linux-watchdog+bounces-4381-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8EABD8FBE
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 13:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 801464ED300
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76251308F32;
	Tue, 14 Oct 2025 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNN9mtc+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8527F01E
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760440909; cv=none; b=Vz5A9kODNEL+3J+BAsthLNx9fSljcOMzn8PMDy7Kfj+5z6M5+hSkkU1WUul8oUMu1TnVoXTBfZFkPR0DgJ9bE+bSpxcRzG+dSCL2G/1h2Z6cwDCzsvvDB4kLd0Ol55ryacKlqcZZnAHmdeQJFqfa+zng266uFtsKHlxmTujt0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760440909; c=relaxed/simple;
	bh=V4UgnndEAoWQMafS9XcNTv+WD0kmsre4aEbjXNj09+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkYkZBsebziHznHPcJfqkoi/FMS1XTi5PAdhZOBHSq18NWvNehvP9z0bUwaqVDnf39eGniGDwrkb4RhjACucN4VmBHETX/XpahyFss3SgGTpHmx8KaW+ZUlYcq0qcy1zanuffG1vfJclaOnjoeMXazrIPjE8uDW8P+FJAtRQK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNN9mtc+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0224AC113D0
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760440909;
	bh=V4UgnndEAoWQMafS9XcNTv+WD0kmsre4aEbjXNj09+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TNN9mtc+QRnDLANSjpG9663zPSFvjC3XF1ENfW50Ch35RKjGcI3Dvrz05e3Dnc3hx
	 eC+uQz6Xf5Fmf4nLE02fn/DAkukF4PKU3YI37x6gaA1cysfUQO+iiKpWnBuQP9hdSw
	 U/7YCobiGp18Pt5UDtyBqkeFLYVMMB0Kw9zi7m0mHUr7Yu+cQ3FVD9XKi11CYijc9l
	 vv5PRzYO6QUaEQj3DMiLRQWLvaB3GJwApeo6yKnCDXHJGcNnfFZCvikwAjzAA9NvcA
	 XpfGYr4+YHavuxo/ZJUsxtSJgrXHNFdDO4QvXrlawhaSToWA1Qe5KYO/kL0N9npkuF
	 D6NYbmeNOVLeA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4f323cf89bso922760766b.2
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 04:21:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUidNVOivO/Af+k1iXBIGdkUWGPylXDReMCG7xUTEPIuP9gnBIch3CEYhgUfBQALpBbcaMNYAJY7hz6LqxDcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjC87qebDXYU5/jpT8k7c9yLi+J8JnAHDNjy2z66CyERTM8bV
	xGzrwj5Z4oz1rfP+fjf7nqTM8EVnM5CUtHYBUPFDC1vQN1Dit2Hog+fo/z3+BKQS5tWxQzS/qlv
	6eOUOO/DpqqvBozxf4GVGd1GLkb8KZg==
X-Google-Smtp-Source: AGHT+IFQFJ2Np+NG3ugMzaDWe+GkZ+aXi/o0Iy+DIcYOZ+94ba34jZSea0/ZcpuxrkqL2Ggtv7/lOiuhvy94dFF/8mg=
X-Received: by 2002:a17:907:9617:b0:b3f:f207:b754 with SMTP id
 a640c23a62f3a-b50abaaf85emr2613953166b.30.1760440907550; Tue, 14 Oct 2025
 04:21:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013213146.695195-1-robh@kernel.org> <87o6q9g6kc.fsf@BLaptop.bootlin.com>
In-Reply-To: <87o6q9g6kc.fsf@BLaptop.bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Oct 2025 06:21:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJO-Fir5DLhZGsSWN2ZXNH+ynsqFXKKqAbePi30jf5EhA@mail.gmail.com>
X-Gm-Features: AS18NWBdAUGK-f76c1EhXtUibmLtvgimLClxI7ztjqjNLZoXweIuRJuyUJy_Ims
Message-ID: <CAL_JsqJO-Fir5DLhZGsSWN2ZXNH+ynsqFXKKqAbePi30jf5EhA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,orion-wdt to DT schema
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 4:45=E2=80=AFAM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Hello Rob,
>
> Thank you for your work. I have one question:
>
> > +  reg:
> > +    minItems: 2
>
> Should we also include this constraint here?
>
>     maxItems: 3

No, that is implicit with the length of 'items'. (For json-schema,
it's not though. The tools add it automatically.)

>
> This would further restrict the binding.
>
> Gregory
>
> > +    items:
> > +      - description: Timer control register address.
> > +      - description: RSTOUT enable register address.
> > +      - description: Shared mask/unmask RSTOUT register address.
> > +

