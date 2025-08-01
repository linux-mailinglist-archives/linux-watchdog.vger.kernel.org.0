Return-Path: <linux-watchdog+bounces-3939-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9756B18139
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 13:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35D221C25981
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 11:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6141123E358;
	Fri,  1 Aug 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbsW1Y8z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C9223707;
	Fri,  1 Aug 2025 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754048515; cv=none; b=bIzlSaJ86mkQoHNtcf9Qvg6lqbxvi60NgSfQta24lpwkJ5zz5ATMkqbxO0WiHcu6kjSs76VP/VUYLyI5Lcjy84NrFp50UjDOk15fSHQtyCf7kmadTIfDO0nlTQ5y6XSMPc/tS4H9GHaCTMGGfAQLhI0pCb58DSSJ4y34RbpJRbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754048515; c=relaxed/simple;
	bh=5zgcWv27kOfgwf/FgHN2jEl6cF4uOEV2nY7x2dD1QXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFUJ/whQPwZtNmZon3XpRuL3fkC8lILTwIZudgNHjqXLI68ptHcCVxBU7DAwsNCQqROAptrFztYFXfBulpmjmJPtMhQRz72mzeARSaCsosa2G+DY81lTeKgme0qWOWEfK5ezHCa3sO1ZLnHYMZfGNtata3I29I3HeoszMIts7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbsW1Y8z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b794a013bcso975096f8f.2;
        Fri, 01 Aug 2025 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754048511; x=1754653311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zgcWv27kOfgwf/FgHN2jEl6cF4uOEV2nY7x2dD1QXw=;
        b=JbsW1Y8zfhyA+kaWJHiGnYkv5Do2jV89vuX6ZDqM1McPoM+tN5JTeYJMfalYUqapir
         mx3vzyfCyj2ipBxLNoPb8h8/wM0gxDq7jUJJzzYt2nMT608+zMpcs+Hf+cOSEZHj4Y7E
         T0pbpQmQKlK8ViV74gQgCCRGSwupsrhj7eArT1Kdb2QKKcv7i41MN3a4EURhXxHW+/k5
         FLfYfWfonA4HYU21W8qwEOp4Fm6Z1RBaKOAJpNqCFRxbil+T/L4nSUU2yu5w8pkxBxVZ
         7vd+ELoDCi1R1KtgX0IWziN1o6Z41nqpr+Dg13749/wmwJflJhFlL4kJJtUu/8NcIpBe
         ceiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754048511; x=1754653311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zgcWv27kOfgwf/FgHN2jEl6cF4uOEV2nY7x2dD1QXw=;
        b=ckyv1cMGl6RuUF76M3/A6rdMF1wmhKfIF8/6faPvMZQqr1MQ6X5RWkp6P8CeX36Zj+
         sm3tDEiOdsE7eEkIa9+bKKSw4JT8gePaanx6XAaWpHPzLfy4oVt4W0GstbryhttNvrii
         XErirtDEjEy/7xxy2JdRc9p+r3WTkeXWFWfzBl31/ftSlxSB+kqp3UP+/u2KYHEh3VW1
         GcCNrMgCtLlqimdioLiBsO4M1cS1V1OS7SRSJJZJnaECO5qn8cJHFXiRu5GrdsxOToOI
         bomcwv9BYNNL5BlSxOFljrA09yqxKTBSDzol+ceLb0qItVfuFnNG53desiMlUXYLjo/I
         BJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2sgGhaNyZMQ2utxdupXDjrTN2AOWaZ4knIkXXEOYaRhWA0OIyKFRBPo8HaYPK6KAGZqT0lT/lkyesxmt39e47Jmg=@vger.kernel.org, AJvYcCVM+q+paR8ljXW2MymJhhrAzgGJn/hFW785DAelDGVpSbAvVXIW0I73WNcjigjvIUjPaw31B8UDEkK9@vger.kernel.org, AJvYcCVUgiPQsHv6lROHOFjrtew3Ztm7BFMrvfVkE0243pRXF4kPS+9e+NClCgUBkv8PlJnzhJB+iO3GBeKcHujf@vger.kernel.org, AJvYcCW5IbayYyHo8qIOmJUkzXteUpZKz3YACj9hxUIRlTOvIe3LzyhuOVI1DxXQ4qrWcB6tJzFf7hYMbfIQYPl+y1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvR6ALci5vOS8FaKYQAJkAYCb4gFL9wUM/9FfU3zf+HudVrVX
	RulMptzC07C5+8sOI7UQPtU8OoEpFpKxYONgiWqlSCxEfcf14l+NrB8dBh4dO4MOVsT77PRhvUZ
	IagH7GcoUmXVYblOUjhMvVUuNqafEb9s=
X-Gm-Gg: ASbGncu+Crv9qIRkZBNnq4CuyInR2XI0eVjj838Jo2wxrKO1CXQ5RlEAs3ncSYS+Tgs
	ndvycKtB4zKcGel/q9JfGzz9gegKW9TzZrt4a0EHqU+pYghG2vOC8Kke4p0saVYGBRjvCEsPbYf
	5gz0H83c3zTBB8v53QCMCr2eKRnlJiPVeSAzJUtnYYHDny59IQvWSJSwUI7J9FFFQqdnkAIn6wB
	eR6wpdZ0w==
X-Google-Smtp-Source: AGHT+IF19siieTYWpm5yWDbheWA40LtTDU+ZKWilablMRyEvIEXJLOdcGsENCXGzTrpqxf5L+YoOubH6TL49und/fJY=
X-Received: by 2002:a05:6000:1372:b0:3b7:994b:8438 with SMTP id
 ffacd0b85a97d-3b7994b866dmr5688135f8f.46.1754048510720; Fri, 01 Aug 2025
 04:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <aIw8u6mZxC8e76JQ@shikoro>
In-Reply-To: <aIw8u6mZxC8e76JQ@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Aug 2025 12:41:24 +0100
X-Gm-Features: Ac12FXzc_vFbg8BxTb0zr5UwnnDeuTuMJmSKHb4FXmvfwV7Bn9DA6DRm8jPz38s
Message-ID: <CA+V-a8vSb+s+AxKDt8Vw6zPyLaLLW67_N+7LVeyaBSNGfJWwTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] watchdog: rzv2h_wdt: Obtain CKS divider via OF data
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

On Fri, Aug 1, 2025 at 5:04=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jul 29, 2025 at 04:59:09PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the rzv2h_wdt driver to obtain the clock division ratio (`cks_di=
v`)
> > from OF match data instead of using a hardcoded value. This allows the
> > driver to support SoCs where the clock divider differs from the default
> > value of 256.
> >
> > This change is a preparatory step for supporting the RZ/T2H SoC, which
> > requires a divider value of 8192.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I'd think this should be merged with patch 2, but for the change itself:
>
Ok, I will squash it with patch 2/9.

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>

Cheers,
Prabhakar

