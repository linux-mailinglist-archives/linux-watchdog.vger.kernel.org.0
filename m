Return-Path: <linux-watchdog+bounces-3926-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA0B151DD
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 19:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD55F54472A
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 17:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828A9298264;
	Tue, 29 Jul 2025 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzCoOhxb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F2294A02;
	Tue, 29 Jul 2025 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753809084; cv=none; b=Qw4v0S62kLojAh0nt7mXcbYp9LgWxt6365WzlkfZIE8TLVZaKHhRBtploNIrrgMMur4UwiGMACbMYePKQZ5wxXZ4F7Sfhi65QxNEW9qz3+2JRDw9UsYCjcp2qPEb10dl9m/DEWyAQpUiV6ej4eXamBV8tpsuVL0zrDy7UYqF+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753809084; c=relaxed/simple;
	bh=p9rc1oOh9mm37WaFrFxx1IcalYyMV1uXikDiay6fcng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUxBTm009I8yS6ygtSpWIh40Qf0j93JUsnV/FsRUcP9b/5zykOxURDdY/nx8dK1F4GIAKs2q+TsG9JXHmRFijGGbahok08HGyYeFPBndqT1Z5SD7ywDClqsiPDhjN1iXbm8U7Ube/iakKUPizel66zaZ21Bw5dqHSemfyQc5n6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzCoOhxb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b00339c8so37141775e9.3;
        Tue, 29 Jul 2025 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753809079; x=1754413879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZANuYZ6czBvWFRoCbDeJ8Q3EHHGA34Yc3WGmzpGe3JQ=;
        b=UzCoOhxbTo5/cKBhNalH3mVl3cUUDFjC8Fj8sB3AvPe5eB0OWLAIapDtJ9yzRokwRG
         A9VSz6JV5VC6SXLP7MTNKvTZy2TavjOy78mY7q1NTboWmn1hgJ02Lc5JPRZXoeYFG49z
         mICXPph7W1h4fnVgs06c68ZvPvDa/13wUXtFiDpbuA3oKuFXxYb8XYOm1LaJOA8DDdoY
         XU2rBaFbC7bxqxCxzu4QiinXIIvaGLpYZdXI5p9DCsI0Y3L11iaaklyyBri3x+3sD38f
         P6ZtuS1SWoytZojVFEhpoxK71HveAK48pUwjWTEik0juj7qzT7KPAOAPzee+so7Y2HIo
         Y9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753809079; x=1754413879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZANuYZ6czBvWFRoCbDeJ8Q3EHHGA34Yc3WGmzpGe3JQ=;
        b=izM4V4GLpYJm3XxUg8E0AsppDSDbGMmVod0szgmrjx7GCIgHAS4ZtndIj1kN57tFwl
         uJWlNATM3JK5+2RUICCjo8QMPupskgvxaIMBZ/qV+w4PthvRXxya9KoSAPfgyiFTajMr
         LW7xocJh5ON1DIw/K/ohnHnBU3ub2b+Xp8YnGJhDLJ2Is7HSQffDC6MxSgqVwIei72A9
         f4fC0sDvO8H9oxhZ372oIX3NZYQqPYfLsqnWD4Eiv625yln+y6vfAtLYHg18eECWc9ZS
         l/MNFau6nEjSZn+/rQU33biUtodKom1U5Q7gMx+8dvcSFMM41QLQOBFfGnfRqgxyARie
         FS9A==
X-Forwarded-Encrypted: i=1; AJvYcCUjpEHYKbKJeTuW5afXR3k+fBZWNrau2JJ5rckzNsmCC9pXqRBWzuX+a9PezB+qNtmaHbrKhlFQIw+QhYEG6bk=@vger.kernel.org, AJvYcCUpkymGyOz8QLkFPzxUutWv0ZsHmM3d76pMetZNWVDhnu8kgoJR1e53rmgWYNLoaGrThQE9NWYqX8/IrZL3R60eP58=@vger.kernel.org, AJvYcCVmLW1IPO6xRxzyskIT4wrfrELGQ7Wy6IwKMV7onmex2fmWxrh4uP42ILvPl60hZJit4cCtZqRz1+Nl@vger.kernel.org, AJvYcCWcUu/GE7aI7QQtdl8zn06cP6ZZQfYXUT7WYhtQFkreT6BaTw70mkYezsNnrZe7BOx8EnIQ9UMOBQf94fcp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq63drYHe35d+TTufHEMsr+FbOekvAwNigJuJjT3+tWcjGJTNp
	N5iKzC1Rlbh44IieDnjlxDKkjZZmcsXy3QYSzTTjLPfVkIHSMprytmCzdMCSC+BSbJ83Qm++tje
	0W6CUYxYfZluh+SfAmTQigaw3dhzWyfM=
X-Gm-Gg: ASbGncszKvqW9BkLzqM8SiR4oIY9W5h5HzCUGEmx8EkGhKj/RRhcsGWi1f7U/zcV6VX
	71sJYVILg6W3+HVWvpCNOGYTLr7NZRwoXSojcw2wAsSZpZeJIzlNVgcVLl4WCVRTrQGf+lobkgC
	2tcO7gZ70dc0Q4fGK39XRPAHY5H86a5lEs2GJ2CiWqj+DEtqOcvmk049anlmsFCfOjvrlORFnoB
	HabK1tv
X-Google-Smtp-Source: AGHT+IF/DfK3nshDycMq33UF1s2J2fEP5HrKgoG4dERgRLP7hoScT2etRMMBfljpNxxXyX06f2h9MJRRvgEXxtQNjU4=
X-Received: by 2002:a05:600c:3e0b:b0:456:1e5a:8879 with SMTP id
 5b1f17b1804b1-45892b9c21fmr6418005e9.9.1753809078771; Tue, 29 Jul 2025
 10:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aIkAGUVGqLcFBoXo@shikoro>
In-Reply-To: <aIkAGUVGqLcFBoXo@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Jul 2025 18:10:52 +0100
X-Gm-Features: Ac12FXyEa0ifnr6d9GCkDPZ_PB-bEzB-WPz4FXCllKXUqrJbsHiXRLT3SSzwN2A
Message-ID: <CA+V-a8s_3hv9z0HFKiUQ76d7FVJ+-vrLahhFVEafZbS3oO8iJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add watchdog driver support for RZ/T2H and RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Jul 29, 2025 at 6:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> >   dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
> >   watchdog: rzv2h_wdt: Obtain clock-divider ranges from OF match data
> >   watchdog: rzv2h_wdt: Obtain CKS divider via OF data
> >   watchdog: rzv2h_wdt: Make "oscclk" an optional clock
> >   watchdog: rzv2h_wdt: Add support for configurable count clock source
> >   watchdog: rzv2h_wdt: Make reset controller optional
> >   watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
> >   watchdog: rzv2h: Add support for RZ/T2H
> >   watchdog: rzv2h_wdt: Improve error strings and add newlines
>
> Minor nit, but still: inconsistent prefix
>
> I'd suggest to use "rzv2h" instead of "rzv2h_wdt" but it is ultimately
> the WDT maintainers call...
>
I agree, I will switch to using "rzv2h".

Cheers,
Prabhakar

