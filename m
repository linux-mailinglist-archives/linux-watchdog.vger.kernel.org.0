Return-Path: <linux-watchdog+bounces-1756-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8396D806
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 14:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E69741C21CD6
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 12:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FA519AD87;
	Thu,  5 Sep 2024 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLuInnLe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA7219AA5D;
	Thu,  5 Sep 2024 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538347; cv=none; b=DDXlcKxr83lGAKZkYPKY7JaCI3sTCc+bYRNX+xQQ6zfKa9NOnEYRwLS59aDHSLm7kaYlRfue+mlztuUBeqVmcI7Ytm2Frry0nI/ZFDgsUMcVTf7OX/AeZ9Z1OhVIIrQnz1cOk8jeLG9wevTa/358i1/vlzRjzU3ZZdiTA6bR7Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538347; c=relaxed/simple;
	bh=FONOtkrHn9wffb60g9bCFmD5Ce6Mpzm24koAoepUZFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUECrZRafxLwprvJ1GUdXM/RxVyGiIsGFuapYPbd2PuxN6NEr+I3MwXUuF3za0VxZBQpWH+2RWaQEcnD2LsfENC/4JjYV02VPMer+tx0X+kvasdXEpJ4BWwOV3zbiKoyA5eKnrx56KIdc0TP9+jHpG9vqCT/LcVE8rPTYhnx44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLuInnLe; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-501274e2c29so10878e0c.3;
        Thu, 05 Sep 2024 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538345; x=1726143145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gZAyTtY3aoGNNDzIbl+ioueHhEM4J2F6ba4GcLwUm8=;
        b=CLuInnLegHd+XHPSVPghafie3UQqCrew+zqk0jBidVXsiJWTlSRxxdHf3u/3wOT5dP
         DU/IV5j4AP8rQKqeJOEyO1bUiX70hPNpDsd//gajwRYph0pQCMovSgxX4NzLTCnWJHXG
         SgsfLC/7ODYsYrVIEav8G48iHKbmsS4r4I45w27Pa1hYuZDVqxsW86gVLP7gd4ni2aox
         pvy8Q0RCOMJnM9mc7KGUmOemJURBq4XgMCIHWoU50TcwhKmQGTZgyfBabfMygmnSR52e
         cV/01Sx9MseL0bIhAVo3vGtuWgBfRUgaGFQSQve22OZ/US/AeGgakV0vn+wT5d3kLrld
         xZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538345; x=1726143145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gZAyTtY3aoGNNDzIbl+ioueHhEM4J2F6ba4GcLwUm8=;
        b=vN5p5r7jhdMk5fYx1cc+DG1kuMzNeBaEpKhKlaL1YjPWgE0wL7uhfIqrhvRzblSrpu
         LJj6wlJ2KHkP6Mj9sOp1NIHWmsrW5yMJtiDmWVb2u9xnewb3vJScqrnjZ07ooAklT9BA
         3rjPV9w57lurVPdYLGSbU+zVawEyZhBGRq/sPl9qsTmwBzStW4VMcUfE1WWsq6uPrjxR
         DiFL8vYGFSZID9C/HniE8UC9E1U/z9neyXO1Tmrr2DG/Fy9TbIrr5yV21NydeDdM2VjN
         dGaIY2Uqd6RiOKhSYbQ2HihxcDIhhnsXl64KdxAbrwZgQja4w8B/mHqhOK/2BVf3V966
         w9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0SOatdL9lwsYOtMrDx8f2VqVGKFCwyBhdBRhaAJfulErAhyRPXD7ZW9x2ghMtcbQKxBz5/1hoNlPAVVxIxB4=@vger.kernel.org, AJvYcCUIyS2LrF4ZRM87PVA50vgfzUVq6RGhGP36mkaD7nyszIidtXVyr89nG2dsgpHbNzHIaTJTiTb8lh4BB0UUzLSsmzU=@vger.kernel.org, AJvYcCVngW5Pc/z4y++SYszOywSS2BpCvQK7Rc4pBm9AHIY1ltRA1KXhfvgMdCR2iUlcX+FXmze5koUTRVjQRnqf@vger.kernel.org, AJvYcCXnJgbLGA9cNl9rD5mbpovVj7NVH5V8WOUHankVSOL261M4mb5rvyCkl7wU8ee1t+81Nb1D075jquMh@vger.kernel.org
X-Gm-Message-State: AOJu0YwfuY4KgeTMBzNKH+3n7bPeYqoKsHnnv89d7Pclg8OGt83l3mTK
	qPUr+6VakIRDlg/qf6MPMAFrYu2zBCnfqOVtBrdHG7puKQdkHo+8FvihAIE9Zm5qR8YG1BQJWZr
	zdRibrzcpOsrZ0ANZrOePAauu4M+Vf7zH/P8=
X-Google-Smtp-Source: AGHT+IHXyw2RxkWhPsZxpmqiSi/213b8QWfi+5HjtH7I9tuPHtt3kLBnh3OYZTkw1Y8/ZGUBwriigeoD0h16GDmtUJg=
X-Received: by 2002:a05:6122:2a05:b0:4f6:a7f7:164d with SMTP id
 71dfb90a1353d-5009ac7a8a8mr21097634e0c.8.1725538344968; Thu, 05 Sep 2024
 05:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Sep 2024 13:11:58 +0100
Message-ID: <CA+V-a8tzZPkdxiivuRvOQoo8ayFttzXBWGoMufDXtdGg9477Yw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Watchdog Timer driver for Renesas RZ/V2H(P) SoC
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wim,

On Thu, Aug 29, 2024 at 8:38=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series aims to add WDT support to Renesas RZ/V2H(P) SoC.
>
> v4->v5
> - Updated commit description for patch 1/2
> - Collated RB tags from Geert and Guenter
>
> v3->v4
> - Simplified calculation of max_hw_heartbeat_ms
> - Turn on the clocks first before reset operation in start & restart
>   callbacks
> - Added checks in restart callback before turning ON clocks/resets
> - Dropped udelay after every ping operation
> - Added comments
>
> v2->v3
> - Fixed dependency, ARCH_R9A09G011->ARCH_R9A09G057
> - Added dependency for PM
> - Added delay after de-assert operation as clks are halted temporarily
>   after de-assert operation
> - Clearing WDTSR register
>
> v1->v2
> - Included RB tag for binding patch
> - Fixed review comments from Claudiu
> - Stopped using PM runtime calls in restart handler
> - Dropped rstc deassert from probe
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (2):
>   dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
>   watchdog: Add Watchdog Timer driver for RZ/V2H(P)
>
>  .../bindings/watchdog/renesas,wdt.yaml        |  17 +-
>  drivers/watchdog/Kconfig                      |   9 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/rzv2h_wdt.c                  | 272 ++++++++++++++++++
>  4 files changed, 298 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/watchdog/rzv2h_wdt.c
>
Gentle ping.

Cheers,
Prabhakar

