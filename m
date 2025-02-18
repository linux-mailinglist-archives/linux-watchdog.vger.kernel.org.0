Return-Path: <linux-watchdog+bounces-2961-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D7A39929
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 11:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D131655EE
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 10:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86938269CFA;
	Tue, 18 Feb 2025 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOCATJiI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9F269AF4;
	Tue, 18 Feb 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874413; cv=none; b=G36DggVvOR8Kg8ZbzttqEeoa11Cb8aiwvDRDPT0XsttR931ImY6KPwbHiPCHesm+BIkbABTKfL/Ms0n05NYkMAQxbNjVuN8hq83i7TIGN7Lz7Z8NpoFhGWd2zEDVavdQKPjXvRddb+57XbUA285We0WLGrDDz4l8ZGU0mK4iHig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874413; c=relaxed/simple;
	bh=mxcTS/TKtzanNcSFC5ycNWuMfjyHKMjimPE0zTyL9R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUVv5q4M4MrfIIo+qfuZQPBv9b263SFkCXGu+zMHS5lYMeYgZgWR3k5lywxA5Itnkw9dnC4JkwDd0/VRqQiY8b0jYKz3iU+VPxW+R+1C3p9NavJe0IrdOCUAqoQZZnn+7IB0X/XHmfzw+nvDlJJemLoidGqM9V9DtU+BbKSJmOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOCATJiI; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5209ea469e9so2075376e0c.0;
        Tue, 18 Feb 2025 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739874410; x=1740479210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fTbNUo/qWCyQ6WC+r9ba4QH65ygmHbCBvKYDPCRYdE=;
        b=gOCATJiIUNJqG89Ik8wyDceo19p7/ZNvsf3VzzwKHlnCwyPhY/Oni8KZMfWbfDsVol
         TqaW//jsSrWs6K90YlW3tR1ArAuh9RL+jsdQSz10mEDtCxKY4WMjaw4VwwKXUDW7W4r0
         Nn/rCp36/Fe+Tb+/1yxiTMwupPbClasNht3gU8D6uCpk1kFORz/cBuJP1v7I4q/z97HI
         PNTl34zP7nb+mjTBzLYFda9yG7W2MlvpSDqkxG8i/MfoS4fnio2IA5fjn4V9qWreuMaM
         2AsRTuUjDlwqUyTSDNx+81pyAXyQSKC/313kPJs40wpAmkWXqH8h65k3+a5AnRNf02jb
         /0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874410; x=1740479210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fTbNUo/qWCyQ6WC+r9ba4QH65ygmHbCBvKYDPCRYdE=;
        b=F18j/y7ULltECgOU/9Ci+K+NkJxc/4U10QuYgI3si9WLHqDYy3a8HjFGNaBS/J9Kmq
         KLHguXjRMj1l+d8pXwq6ePWfh/93D6WKngR7xQgfBXbBky0/Z1NVa4+RI03ZxtZ+oTqu
         YhafWL/s5QkhCxPzmT0qCCUv9Zcm0+vmwJ9YCGfpFY6h8PPoqiOY36w0H7R6eMDFJ4x/
         YCkQgBoaBvzCqlhFGnwl1+gYJYSRkkRAFs9UH7cDeD0NQ4n+QKVSVs9m4COEuLRo09Zv
         /t8YCyXY4PJn3XrBHORBA9Vv69zunMA2Upxb/U/5n2vw0HiSqbJMxEPoIaj7fDsQiICa
         Si8A==
X-Forwarded-Encrypted: i=1; AJvYcCU3MV8MeNJziTveaqOn1R4Tp6l7CFjOg6RWM8UfQaTd8uVN7i25H2F9LNpHtC63pDodOgSVFOqigDBKSnTA@vger.kernel.org, AJvYcCV1L9TDXjaAJyTK3CqHMg9v+rZb1Mutme06EaABjT7F9FQ60bHxjTLWcqPGaymhaKdPgTEMF9omUl5FmeOrwxk=@vger.kernel.org, AJvYcCVaX77T/PBSd8PRMCfdxcMt/lj69yrFeNkT33+WfczeFrorIUYeX/97LkHYwqEWI9zTbn10cr8aWNvzBO2o7iT5spo=@vger.kernel.org, AJvYcCWkYoOmnQm1tuFJnGWXS1FemJrsae0YlLrZ/3/q0lpAD49p00BWz/gW+fUdx0K7VqonjI45twykYXAM@vger.kernel.org, AJvYcCXU5weLmp2K6+wDHTndw0hD7M6fnR7MB/tkICcpTSufUuka38ka0jD/GSeSdjh8/StWV3Y+26RzSzX9@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrCDR0iLSo3Z4HOm9hZPhWBbe616CVB294XNTe64yW3Cy6lzT
	oyjTX1wy44tebABdmhs4/WU/NcbFW1OYlI4lm2ZTpPv1EX73OqSNRpwl0FXBz5BdIqcCU3QIgVt
	9smRtyZfVb9ooDh4WIJ0KUd/kRx0=
X-Gm-Gg: ASbGncsPLhFiHVJ4hHlU9Dk3v5fJai8zgKvs0wjU9HPbWyI0ecpGceIER1katmrsUxh
	fGolBso2/zH1dzEQ7hSPtAXj0FyhLJGhw3+M0mgrh4TjqxfNySSZrXYASef+Rf9W6XhTjyr1MmD
	2GYqW2ZU1TN4eqD/Ea6mLTBu/+knNahQ==
X-Google-Smtp-Source: AGHT+IEiB//Rvg/toRlYTHXOR+8uze5zclaIXpF6byYRu0iJ1Qv+6YSH2lmjvsHIbp5ehoRcoDDnqpS7HCosXSGukek=
X-Received: by 2002:a05:6122:658b:b0:520:4d63:72da with SMTP id
 71dfb90a1353d-5209dc87d29mr6025043e0c.6.1739874410535; Tue, 18 Feb 2025
 02:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Feb 2025 10:26:23 +0000
X-Gm-Features: AWEUYZl9Hr4rbmCZyrRt1t9_8JazRp98fGvLiEsB-9wshbaMSz8hdT9fU-lDNfI
Message-ID: <CA+V-a8uOkKzijsS_dmOA1XqHYReR3n7cRGUngh-6wJG7LDRvOA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Add support to configure CPG block for watchdog on
 RZ/V2H(P) and RZ/G3E SoCs
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Mon, Feb 10, 2025 at 6:49=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series adds SYSCON support to configure and retrieve boot
> status information from the CPG block for the RZ/V2H(P) and RZ/G3E SoCs.
> Summary of Changes,
>
>     Clock:
>         Add syscon compatible support to the CPG block in bindings and
>         device trees.
>
>     Watchdog:
>         Document the renesas,r9a09g057-syscon-wdt-errorrst property.
>         Update the watchdog driver to fetch and report boot status via
>         Error Reset Registers (CPG_ERROR_RSTm) and configure the
>         CPG_ERRORRST_SEL2 register.
>
>     Device Tree:
>         -Add the syscon property to CPG nodes in R9A09G057 and R9A09G047
>          SoC DTSI.
>         -Add the renesas,syscon-cpg-error-rst property to WDT nodes in
>          R9A09G057 and R9A09G047 SoC DTSI.
>
> v3->v4
> - Added support to configure CPG_ERRORRST_SEL2 register
> - Updated commit messages
>
> v2->v3
> - Updated comment section to mention there aren't any ABI breakages with
>   this patch series.
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (9):
>   dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG
>   clk: renesas: Kconfig: Select MFD_SYSCON for RZ/V2H(P) family driver
>   arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
>   arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
>   dt-bindings: watchdog: renesas: Document
>     `renesas,syscon-cpg-error-rst` property
>   watchdog: rzv2h_wdt: Add support to retrieve the bootstatus
>     information
>   watchdog: rzv2h_wdt: Configure CPG_ERRORRST_SEL2 register
>   arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst`
>     property to WDT node
>   arm64: dts: renesas: r9a09g047: Add `renesas,syscon-cpg-error-rst`
>     property to WDT node
>
Gentle ping.


Cheers,
Prabhakar

