Return-Path: <linux-watchdog+bounces-1071-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026AA8D0E6A
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2024 21:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1BA028290D
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2024 19:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFAA20DC5;
	Mon, 27 May 2024 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsDg2wqT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA91E888;
	Mon, 27 May 2024 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839717; cv=none; b=XlRj6+kWuMJqQVfYdgFkFa6XoxKdRvjtr8P7Gdg0uhMKmD+pYLOUAi00enjDQIOo8cUaxNd/C1FBhJGwMHksfjm9C7Nt11n9akURInR9mhxEl1IhbJYAIPz5WIloRxPizZkeQ1Dt4/Iz/2bM3aIZdvmJxXH74GfZ+003pV9YZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839717; c=relaxed/simple;
	bh=CBEYxiqpwGu0lFDgZVYcDx7jyV76ErM0r3EGkJnKlgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvaKQthoFyUk7LrIP5OS4IPLJKfQzwtUjNUaR3900hiI4NzWBhxOqwmd23cAmK1ui7l9XGtbS86KnlIwYZKxhcu2wWA2VXpBm7kxh7qhsH/HR75HT+V0gDAc9L3ba3f8vV0zxnX04NjolAF1wospKeyHYfCIQMFJzOqYDC2TGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsDg2wqT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-66629f45359so120685a12.3;
        Mon, 27 May 2024 12:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716839715; x=1717444515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZG1HwOVbpyB8VcDuQJ+Et/cl6rWUv4pX2AyPqNrrH8=;
        b=hsDg2wqTvhsGFPcgK1ufQKYSJGqjsihY9Orp4F7im6f5wYZ8UdBYbsr2Te9qOMM1fE
         9Qoq4TO9Ep7wttryV43gRWGMWvxq42kQCqaFkVX4TsJ4FMFrEibUhEbDDwYaefIFzs0j
         qScVi4SAZhzwE4hQcb0SXQ9uPoQAxC9u9XoLICpYkaKholPc4U1ScT598EPX1AhrUFEg
         wmtH9JaMDo0CjpwXRah8P3G/puJL/2hZkOc6zHp+cazztjZklddbwH8wTUTannD35DTA
         R+X7jMGjyDaYof0391+cjwDahPpT6MsMZx8jguOPV7gRxQXgGTi1L77o1Yb4AG1c1NWi
         WBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716839715; x=1717444515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZG1HwOVbpyB8VcDuQJ+Et/cl6rWUv4pX2AyPqNrrH8=;
        b=sh5d0uGJMSILIpHRzEghjohdnRhCvsZYHWsEUH+Ec7MFa4DWm+WKBfTfZ2gn57zacz
         t/6N0v4LLcdXkPc66x4BbGYTlr/IYLeHttvO3dnt4KxD4tKovF5vroWZGE6d2TjINOnF
         fsok1sRNxCP5kWlp73h2QkYHDABBhMa4pg+ORoMpkqBUhLWfGy3Y+4rB2V9cxv0bRQBH
         tGXmMkfCwLdCc7upb1O7iFVncxt4K6TC1j4jHNYYSZ9+szVqI7pbqFXVUs8qe0tdNbGE
         aHb+1us35HLPQwvWtpgyeSevSRVvqcrbh2oL5H2rbZz1DxGC2kgqlzxNv9Uzi0Z+CnmE
         5SWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4419+rnPbNlDxY7o7gE1p21nl6pdtugJmQj4Tb6vg6dTvPhvOYRBTjVWia3mymHz5jWLO/nK8oMYssea7aW1sPQrCF6U/kE6eCWbjSBzh0iFt7k3O9S2pacIrp/EONhbvKw7EyTyATFsYyrK4CQLdSbF5jE8DR/lp4LDSz3hPc4ZooBPEqbVT
X-Gm-Message-State: AOJu0YwJ6TFp0m6N92zKt+YJQloFWX1lCJIfN5gjDmRk6J8oIzIXiwjf
	sYk597soV9QKXahss6InsWwt16eojyvw2YrURU6h8EnrIg+NOEDL+F/DigITHVZfJRMr2apJSkL
	NJQ7rc6D5m5R6T+b5zpWRz+qtc7o=
X-Google-Smtp-Source: AGHT+IGs3GTgR1SK7v+836KzUgTjgC61L+TjLdHM4mK6KubTVhvj98VtFsqSoWZez08mML7cwFHLbQmOv7n5Dj+NCAY=
X-Received: by 2002:a17:90b:201:b0:2bd:82c9:bd40 with SMTP id
 98e67ed59e1d1-2bf5f408a4amr8962904a91.48.1716839715179; Mon, 27 May 2024
 12:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527062102.3816-2-shresthprasad7@gmail.com> <771db1ec-115f-4b96-916f-3975ca302f55@kernel.org>
In-Reply-To: <771db1ec-115f-4b96-916f-3975ca302f55@kernel.org>
From: Shresth Prasad <shresthprasad7@gmail.com>
Date: Tue, 28 May 2024 01:25:03 +0530
Message-ID: <CAE8VWiLbxeKKtW051nPxagRq6xqZ+J1SHrG=AhOx+NALv7-GGA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: img,pdc-wdt: Convert to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 12:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/05/2024 08:21, Shresth Prasad wrote:
> > Convert txt bindings of ImgTec's PDC watchdog timer to dtschema to allo=
w
> > for validation.
> >
> > Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
> > ---
> > The binding has been checked and tested against `img/pistachio_marduk.d=
ts`
> > with no errors or warnings.
> > ---
>
>
> Thank you for your patch. There is something to discuss/improve.
>
>
> > +
> > +maintainers:
> > +  - Shresth Prasad <shresthprasad7@gmail.com>
> > +
> > +
>
> Just one blank line.
>
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - img,pdc-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 2
>
> Instead of maxItems please list items with description so the items will
> be described.
>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: wdt
> > +      - const: sys
> > +
> > +  interrupts:
> > +    description:
> > +      Should contain WDT interrupt
>
> Drop description, redundant.
>
> > +    maxItems: 1
> > +
> > +  assigned-clocks:
> > +    maxItems: 2
>
> Drop property
>
> > +
> > +  assigned-clock-rates:
> > +    maxItems: 2
>
> Drop property
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> Best regards,
> Krzysztof
>

Hi,

Thank you for the feedback.
I'll address these and resend the patch.

Regards,
Shresth

