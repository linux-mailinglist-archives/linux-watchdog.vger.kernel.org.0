Return-Path: <linux-watchdog+bounces-3943-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C07B18500
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 17:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 026007B8886
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 15:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D414270542;
	Fri,  1 Aug 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/LdQtDa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832A1B7F4;
	Fri,  1 Aug 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754062283; cv=none; b=fmCDt0CIGHHgdxtpo/1sayiIbA5lDEQnM63CvLV2PKHrODO3DLpZXPdBf7YEysbVj4kYU1qwxcKOqg+SbD1TPLiQXFJpEkQ9OK2MC2ZmaxwlAWsW95jhU/4DQNy3RVySDl3u2opwkZo2ncjN1BMVJ45SThBgoP9KSNl/SKHPG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754062283; c=relaxed/simple;
	bh=y6mkOrGwcWMo5LKjnRE7fq4giaHva3fen9P05JzBrBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDsNm+Spl9zalAv8nYBdtnFsb5TxXbjCwAFYrfQuHE2E+XZcQodBltG+JdPrkwNkk65fs6oDHfWM+MAW/3a9eDSJnb+KkLDXtA90s4VCyEMLsMq8DOvoMbH1lxnHdG+F/jiQAAGW2XVU8MQS3bJg7rb9r05typf6O9avN3G7AX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/LdQtDa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b79bddd604so1339238f8f.0;
        Fri, 01 Aug 2025 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754062280; x=1754667080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4UHueSc9BAu6grTRDLcGU5I69yEzCQOkcHM/+5O8oc=;
        b=H/LdQtDam3Yw01AsW6ya8OY+7HjidjuFXM9v/zTToyAfkIooTTMG6n3+7xF9YJuXZ4
         N6NiVne0WQJ0OX6TXtMoSCKJ9MG11mnq0Ref5YK91n1yJDdGtN33X6UsuTwNNr70ycEx
         W0FfB8qpUwNH20XGR4D/T+8My+VBah196rDO25jOFznmHi6mgu44BfkggkmKzx+Gq4ng
         ckM2fobB6ld5tyPRKqpoRBXL4372stB/S8jx9Qhf7KtHycViarIWVSuCWJZjWTQnWv4h
         ka/6psG3G/TukoZJGA/UAxAdp+zdQF9/DIX0BoGtPRvJ8Thv74W6D6y/RJM/Dr3oOoPb
         tbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754062280; x=1754667080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4UHueSc9BAu6grTRDLcGU5I69yEzCQOkcHM/+5O8oc=;
        b=sKZfxka4gm9Udukxys8cQSKGo745I7HVmY/Xl0AwYdF6OiSfi+HFW6QSUqNstWFyX/
         Q0xpX0fhuGgc5fnKzzdPUjgwsXHMvuqSrKbQ/49vgZOHvLjsNc7qjP5LWIoAbOFNJCli
         0fYYMQ3jVpK8ggY9kFpY6bioou1YoYNAH5QL2NkTkqGZYCN42Cpl7h9AaRwNpCtLyxwJ
         iyZMn+HPBv/4s9A02bisoQytnC9UTwTzB4O/X71cOj4S2xTn9CnNVF8GcW1cdm6ogEFM
         qXOUsF85DShDWnTgT3riLEV1EdJq79brgaFpzAx0I9dHrW8riuPQb5BA6C1gIQgiatMA
         cJag==
X-Forwarded-Encrypted: i=1; AJvYcCUHusADv0SmBzRA7iC/TzacCjqSygKt0qZfnGh6ROO2RmMKxocrqdqb830yiS1qR6PqCzPGEh34UleDXBVKnkvwotc=@vger.kernel.org, AJvYcCVrhyFM7XcbDMPBqlKT4E1m9ujLWqYNwXUpVMpTqYqs+WDMMBpkmF5C6Cl5biXFCKCtUuxQ0qVHmtczSjMQDQs=@vger.kernel.org, AJvYcCW5bfJ+Ue1WVpT9vH4wZR0ZRBeAhspx93NusSL+aWGysOQLBHXJ2huApwUS+wo4yjGcNKQVf99Kov6O@vger.kernel.org, AJvYcCXeDlnDwLL+JYjzgQa1+QtZMJ7JF4Kw9m64is+EzGn2Af4nBTfM/sDlBO3oOT/rK9Nagygn95zfiyBENf59@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ROWQSIooIIkGKQjv2aUDOR9DxQ/KDG7Fdw/LiNBeVTDBCgq1
	CcZJw+m3J34FGISU8mCS/HHwaoeMhHMhXggE5Dhu7TNl3ukp7TL/XrF+AfM9f0Jnyvx2McY31UP
	Bt8FO9wNhxLNDHDglg1RFXBij56KBasTF+NSp
X-Gm-Gg: ASbGncu3E8oUda1l9U+XyYfJ5y484QXOkvyWggH/sdbO6bzACjlYPfoFs/BAiP+nwtZ
	9/fy/iLjd2eZkto8Lmm6fQd6QhP8Uf6kAPAMQHrNlk3sHpZZDwBCKrQWRE9cLP7w+QqjOsczM7b
	AkizlLkAlpXsipxjBcHe47+Wy/o3X1QcV+Y2ReAqDQmD0NEEnpy5epfblG2AAxZVqObhR5ZbucB
	bU63Ixi
X-Google-Smtp-Source: AGHT+IG/PEclFnHnCQeI2QGLM29cWdJHKI1N8xyEXdcVOwzbQatLkiNjlXHy9Zk8mQM/o19QgqGiswZnW6NA2rQ+Lq0=
X-Received: by 2002:a05:6000:1786:b0:3b7:8d2a:b33c with SMTP id
 ffacd0b85a97d-3b8d94716bamr171723f8f.18.1754062279697; Fri, 01 Aug 2025
 08:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aIw-P6zkQSOhvYJW@shikoro> <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
 <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net>
In-Reply-To: <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Aug 2025 16:30:53 +0100
X-Gm-Features: Ac12FXyy_ISzry_ypkaPqy_BT3ZWEZfMu2muHoo9P9HSEXIjK4mKJRz5zn1zayk
Message-ID: <CA+V-a8sDP7iir-bPetbCw0fakPRxua5F-F1hVvXUD8bGAMdhFA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Aug 1, 2025 at 2:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/1/25 04:05, Lad, Prabhakar wrote:
> > Hi Wolfram,
> >
> > Thank you for the review.
> >
> > On Fri, Aug 1, 2025 at 5:10=E2=80=AFAM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> >>
> >> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Update the watchdog minimum timeout value to be derived from
> >>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
> >>> consistent minimum timeout in seconds.
> >>
> >> I don't understand this change. Why is the _minimum_ timeout based on
> >> the _maximum_ heartbeat?
> >>
> > The reason for deriving min_timeout from max_hw_heartbeat_ms is to
> > ensure the minimum watchdog period (in seconds) is compatible with the
> > underlying hardware.
> >
> > max_hw_heartbeat_ms is calculated as:
> > max_hw_heartbeat_ms =3D (1000 * 16384 * cks_div) / clk_rate;
> >
> > This value varies by SoC:
> >   RZ/T2H: cks_div =3D 8192, clk =E2=89=88 62.5 MHz -> max_hw_heartbeat_=
ms ~ 2147ms
> >   RZ/V2H: cks_div =3D 256, clk =E2=89=88 240 MHz -> max_hw_heartbeat_ms=
 ~ 174ms
> >
> > Since min_timeout is in seconds, setting it to:
> > min_timeout =3D DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
> >
> > ensures:
> > The minimum timeout period is never less than what the hardware can sup=
port.
> > - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
> > - For V2H, it=E2=80=99s just 1s (174ms -> 1s).
> >
>
> Sorry, I completely fail to understand the logic.
>
> If the maximum timeout is, say, 2 seconds, why would the hardware
> not be able to support a timeout of 1 second ?
>
The watchdog timer on RZ/V2H (and RZ/T2H) is a 14 bit down counter. On
initialization the down counters on the SoCs are configured to the max
down counter. On RZ/V2H down counter value 4194304 (which evaluates to
174ms) is and on RZ/T2H is 134217728 (which evaluates to 2147ms). The
board will be reset when we get an underflow error.

So for example on T2H consider this example:
- down counter is 134217728
- min_timeout is set to 1 in the driver
- When set  WDIOC_SETTIMEOUT to 1
In this case the board will be reset after 2147ms, i.e. incorrect
behaviour as we expect the board to be reset after 1 sec. Hence the
min_timeout is set to 3s (2147ms -> 3s).

Please let me know if my understanding of min_timeout is incorrect here.

Cheers,
Prabhakar

