Return-Path: <linux-watchdog+bounces-3937-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E2B180AD
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 13:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7E0F1899314
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 11:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3212222BF;
	Fri,  1 Aug 2025 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzPbsVC1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC81FE451;
	Fri,  1 Aug 2025 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754046367; cv=none; b=tIijeGfiQNhHSBWBMDvGKej75jT/ifOZLV0BXMSJY28O1O5gWYRbb+qTgY0SMeBT6zUWZ3vF63EpZ4au0Pg2jZjCABPkI1dKCYdOvdE1WckfpYectUfBUzQs1thbux4NFh7ZUudfmRKnuIes+RYh/vXFoVxs+ATqzg/G3M0v8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754046367; c=relaxed/simple;
	bh=9Mw0t40fjQ76HH/OAgll6gVUTRT1TaQS8IoUhIok9tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9FhmCSDuIkao9JaLBFnlTllUy3jXZvCTbbswdr55wAhO1gkFb80u7NeEpoChyViK95C/G5s4kPrwCqLwmFR/1ceBBhwLwfpudyKDN/nq9iYvXZaRnJHL67WNjPNbgSu2+Sw9aqTSKeT2Kn2R63bHParqVpN5WQsktzshu+SN5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzPbsVC1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4555f89b236so12530785e9.1;
        Fri, 01 Aug 2025 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754046364; x=1754651164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Mw0t40fjQ76HH/OAgll6gVUTRT1TaQS8IoUhIok9tE=;
        b=LzPbsVC103ou0ABQ1b2ZKne1VyRK3At9902o89oNzF/aZ/WWL78yt+8QrDAWjte+tu
         cZlPo27prjiWPLVz0AqF6yl3Y9vbyeH84Q8lLc1OpEpWI2eRByxXWo6HPECIY20nbZuX
         Ldph3pBENAKeSK59Zd2MQcWF0DyNhezvkz3TDZWOZcz962Btyd6wrZs4C57r4WfcU2AS
         X1l4YP1fxnCjHyQr7Jv4ojU2XcZHyRk7CRCF/4B8SUAyR8uriTGcJVvlPprC3mp0uO6r
         KOXhDN+7/xQJQFiMz0vr67cW32bZ1LvfnBpddJQ+x0I5+lNhxaSxO8Izk3zyTQ6lDTQY
         tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754046364; x=1754651164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Mw0t40fjQ76HH/OAgll6gVUTRT1TaQS8IoUhIok9tE=;
        b=N7Z8uuQdtqBcevtxjkz+BaG9cXFkDOyyj5B7th/uf06ebY2R/fL6R1DLS6kHtkIr2x
         0vc9CvVroqXpm1AOHlD2vFL9GYLxyjDkqWjGXDtYWH4AvGHOzFXEVLPzHEQQFKVe9KcS
         iDw9KBgs7QMF+3UgeucADt8IYttiJ3jAGIAV5cPz6K1JpOVrR1fZdl+bwxd4jtNVUkbZ
         +LxqVxF4ONzxLndv26IqJRUhnzSOlLC8e8t3cM3ESlkSPTyZjHRebHeMCN5fmMGIZg9U
         GBrVcp1JuFL3THD1pf0Uw3+QjqzfeYS+nRgjW2MOzcbbzN8zSIXNdV4EY6HBkZjofmV1
         IUqg==
X-Forwarded-Encrypted: i=1; AJvYcCUWiJPnPxOvvSoIQRCLYd/m2c65bJIyC2MeplsdgpbKfhoJZ7G5BIFVO8jKLxN7dWmGrJ0oNlY1h2Bt@vger.kernel.org, AJvYcCUnhLQykJNiWRy0MsUwHhx21sph7fI51i1VfK6pzjffmZFG4rY5c+l46bSeL6x2V1eHs6DlSRTFqhCOVuba910v28g=@vger.kernel.org, AJvYcCWQ0ilRjb5C8v3yYGELWMwY5vSrN9VNAQBfRqf1aJYKO85aB7QO5JG7dZVgG9R3GrChfJCUdgtyrWwJ7bQc@vger.kernel.org, AJvYcCWfm7M8MWGHUFsRXhgi40yth1HJizZanQ6DGLIRFjXO6prjgMVbKdPPjEv/IEbQMv1E5fO10wg3k0LP6KraQr4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1tAYpbmlYH+W2Xu8jVEOaAC2BOmY9bLvmtreCg1qkNjrE4CE
	eiv0S8Eelks2A+W2OdWYUq2w0VQXAtFPAP8bMvlXUAsJgT68z4+JXo6yV6zBeajfzjm4LlA9Rks
	srJqJW8KLDU1RYOBLqD4Q1rfy0kf1VzY=
X-Gm-Gg: ASbGncvCHL+j5K/hn6dJi0o550hLv9Djyh4pY2y0bkKPqoZAMDaVyI5VkTDcsD7Y0jB
	EgMguMBS/Qy45RdoLaRgieZq9n/stNgTrOiUE3pyV8f7CBq8tYak09l7OSH3GMPm0sUJ7QIBMyr
	Gf7ZD/JN7ITil2Dn2dM6AESPMKygRmXfgOQTfAdxWhF3LezgksjIrt8ba+uHdcs/frVVfc0kGJe
	yzDmyaABQ==
X-Google-Smtp-Source: AGHT+IF6rbYUAUvHLGMWrspjPR8qmEYWgCvQGOHemjzTIoQpAQgpNsCVesAlJQuzFTMxOvVJAMW77LFWCD8as4pka98=
X-Received: by 2002:a05:600c:c493:b0:44a:b478:1387 with SMTP id
 5b1f17b1804b1-458aa451b6amr23386495e9.17.1754046363760; Fri, 01 Aug 2025
 04:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <aIw-P6zkQSOhvYJW@shikoro>
In-Reply-To: <aIw-P6zkQSOhvYJW@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Aug 2025 12:05:35 +0100
X-Gm-Features: Ac12FXwdhscTbtCEXx15hTQ8-vO126tqeuyAQYiMx1pJw-10W5cz9cIf6jQQ0kI
Message-ID: <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
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

Thank you for the review.

On Fri, Aug 1, 2025 at 5:10=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the watchdog minimum timeout value to be derived from
> > `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
> > consistent minimum timeout in seconds.
>
> I don't understand this change. Why is the _minimum_ timeout based on
> the _maximum_ heartbeat?
>
The reason for deriving min_timeout from max_hw_heartbeat_ms is to
ensure the minimum watchdog period (in seconds) is compatible with the
underlying hardware.

max_hw_heartbeat_ms is calculated as:
max_hw_heartbeat_ms =3D (1000 * 16384 * cks_div) / clk_rate;

This value varies by SoC:
 RZ/T2H: cks_div =3D 8192, clk =E2=89=88 62.5 MHz -> max_hw_heartbeat_ms ~ =
2147ms
 RZ/V2H: cks_div =3D 256, clk =E2=89=88 240 MHz -> max_hw_heartbeat_ms ~ 17=
4ms

Since min_timeout is in seconds, setting it to:
min_timeout =3D DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);

ensures:
The minimum timeout period is never less than what the hardware can support=
.
- For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
- For V2H, it=E2=80=99s just 1s (174ms -> 1s).

Cheers,
Prabhakar

