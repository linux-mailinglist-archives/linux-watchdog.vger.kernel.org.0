Return-Path: <linux-watchdog+bounces-4303-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90273BB3857
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 11:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4486C3BBCD7
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 09:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CDB2EBBA8;
	Thu,  2 Oct 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AA8QEKMf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C22FE04B
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759398846; cv=none; b=GXsjstCZPOmoRKv3YHs5OVTb4ILvcFCLiO/nUSrg9WyJPlcLv0Rlvpp0kWEDLvyopEPli5g1oizDyTGemi0sMOIJIZpNT/v4IwvdyEWbNSvJ1AdIa/msr/2QuBxuWAzupXcqK6GQnut26nYvl9I8JxTv4eg2d9G/gzv9sfHQUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759398846; c=relaxed/simple;
	bh=KY7oJVD96cnojEf0Z1OMA1GM0LEH55wJF3Kcg/twpZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjAUca5gMQiyjsdRdp5Ho80EyznxwULxk8gbxao/btUwCUwRsket7x/fliFSO/+kIYXtUvDW4KRTPGgmg5J9hQu8lRRQS2vSYBsT+pDS32yRglFTYJLW9QUKs6SMso102XFtI/0jykqKMeIuL3kaCTarjSmj811RuR2pkq0+IHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AA8QEKMf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee12807d97so681347f8f.0
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Oct 2025 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759398843; x=1760003643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXMSGrr5AGBLO1DMGf5WoRV/437AE3YsJ0D/ngwVj84=;
        b=AA8QEKMfsB+H4sRGsYnsZAZml4yVDBsLl2zI1fP+i71g50/1xb+xXsYqe12bNnd/oM
         tIGDKWInFGk442P6NF3g85iT97pptXc5uDtvhz98PU2TXrufJDSODuYKBGwGiJl9vZ84
         2LCGNQZ87fRQJAXwf0fC8dBBpGvE0LRh0FgIWSVlyoNbS1oSbxutnHZDyGCSIIRIiR2s
         r1o+V+8qwQQVMWMUFfCDHyDkL9P8lImd+yfV3PCukJ1ta4vbpDIB+pSTnyhCGizsyKK0
         3Ak6RcNrGHvtmiappq3LEED4w6ovxexU2qOE1zN0oOd2CePBbMUTlp5oLNiL03jfGVCG
         IS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759398843; x=1760003643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXMSGrr5AGBLO1DMGf5WoRV/437AE3YsJ0D/ngwVj84=;
        b=uvW8iYbK+1iOI6dSp3OcuEyEEbtKfbv5ryQWFGw+wlPRgWTHy0GXyY6nRlY6o3Xhch
         Qc2uvbi3MxNr9fYh1UAdC2Q3GjV3I4jkF4lMxQJwtBDCHgKGalD+MBQwA0SaJvTxaZnA
         TiQ4CSkXUXst2QfMaUW2k8knFTvazU1Kt+QefH8GSPfTlvJ+Uob6K+IFErcm3OyQpdqe
         j6j6ZDi6sXXuWV4m+IhU539PVpHEJx64YbIdyOV+N/bCiUeubJTgG3qwVANLd/ni0rgt
         zJvaZkBcY84DnHROWAdRpjDttMUwgQPiWn+dPRuu2FmoucZ+V1Tx3pJ0WC9dcQ+TXUwP
         pyLw==
X-Forwarded-Encrypted: i=1; AJvYcCWkbmS8mfILg3Pp+LO4n94Wt+i1AP+SJREKFIQiCBk0pDei3t+QP7RV0ye92am2uCeIHxggTCeq/Xf74emWUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhRWYGjikfu4tOUyt1YYCjSbAD47d5XAr3+JWPB0QEmwC+FIBL
	pptqGXBSTfNR9KmKWLipb33XfdysDnIDAyH0CcGf5UW3MH4qgyr+6tqOsD79gR1JzzPm4cp+vDg
	znmgU0mhHfCYx3cAros2U4Wfk1FywuZ0=
X-Gm-Gg: ASbGncsF3/E699spmgfrFJ9F4l3yjwiPk5auFmTZhPIIcQ4tS/vc7cavtXhbvg/h4Tb
	5jk+834R2cfkuFTpRRo0A/ZkhFrgOPKcA1FhDpGxyxwZElDXCg9fHQVXN0Gi5YPPbmqBM/csTYP
	KwCKeTD0HPv7+bIcD8VBp+QtLKaqZMmxI7XvT3cDJ2CiNIHLXEpp+y+qomeeLCsEdH7jFw/Mu9o
	ZoN6YKeymZik1S06lWq05MLyknL4xjiiWCUM0+sOha1uzwMq6UspKNDijEbR/1g
X-Google-Smtp-Source: AGHT+IFyxrSuP40tpzGopQzLFOO/js8UgU+MXvmMqceOi0CUmwG9jtBvk3DYF4XZ7ZAoLNX0k47RM5pg5rhENgLvKJs=
X-Received: by 2002:a5d:5f87:0:b0:3e8:e52:31c5 with SMTP id
 ffacd0b85a97d-425577eddb1mr4683590f8f.2.1759398843030; Thu, 02 Oct 2025
 02:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com> <20250926112218.28723-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250926112218.28723-2-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Oct 2025 10:53:37 +0100
X-Gm-Features: AS18NWA-dFJzWGXuZztR2zqmly5nFCsmHxqrdNUIjCqymp_8OwjCsnbC4Mcge8k
Message-ID: <CA+V-a8tc7KpE6zvLffV0hUrw=1LNxyxZnkgogMBpGhk8u4Z+nA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: factor out RZ/A watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the patch.

On Fri, Sep 26, 2025 at 12:22=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/A
> watchdog to make handling easier.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../bindings/watchdog/renesas,rza-wdt.yaml    | 51 +++++++++++++++++++
>  .../bindings/watchdog/renesas,wdt.yaml        |  7 ---
>  2 files changed, 51 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rz=
a-wdt.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.y=
aml b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
> new file mode 100644
> index 000000000000..7078218e0759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rza-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/A Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r7s72100-wdt     # RZ/A1
> +          - renesas,r7s9210-wdt      # RZ/A2
> +      - const: renesas,rza-wdt       # RZ/A
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r7s72100-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    wdt: watchdog@fcfe0000 {
we can get rid of the label, rest LGTM.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> +            compatible =3D "renesas,r7s72100-wdt", "renesas,rza-wdt";
> +            reg =3D <0xfcfe0000 0x6>;
> +            interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&p0_clk>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index b6e60162c263..8a25e0c6271f 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -13,12 +13,6 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - renesas,r7s72100-wdt     # RZ/A1
> -              - renesas,r7s9210-wdt      # RZ/A2
> -          - const: renesas,rza-wdt       # RZ/A
> -
>        - items:
>            - enum:
>                - renesas,r9a06g032-wdt    # RZ/N1D
> @@ -140,7 +134,6 @@ allOf:
>              contains:
>                enum:
>                  - renesas,r9a09g077-wdt
> -                - renesas,rza-wdt
>                  - renesas,rzn1-wdt
>      then:
>        required:
> --
> 2.47.2
>
>

