Return-Path: <linux-watchdog+bounces-43-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF797F8709
	for <lists+linux-watchdog@lfdr.de>; Sat, 25 Nov 2023 00:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FC901F20FAB
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Nov 2023 23:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CA83DBA0;
	Fri, 24 Nov 2023 23:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWiD5pXH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C68F19AB
	for <linux-watchdog@vger.kernel.org>; Fri, 24 Nov 2023 15:53:50 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-67a25fb443bso627756d6.3
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Nov 2023 15:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700870029; x=1701474829; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FS/kIDFBzyqgGanxolvGaA4a07brcriqTmvix5/W40=;
        b=qWiD5pXHBCg2vzoSh/laMURGROxnjgh99nrQCmshyhkhkM4i/1oNGXPO0Ip/KqieU1
         H4s300jNqfGuWj2hM7hVehnp9hPkgTUCQPUWtJN77EDZZllEEx7DJ5vZ2N6RE5/rJSS5
         QSM2TegbxnY8qHjVTgw0DEqW50gGzh+Q4iL6hXGulKkPa/YJIivqp/5wjPMbpbMYRfLZ
         Tvizae34QDQyUUIOsdNhgcp4Emey35jL7nM5q5uthJfUMVdPg6YVPKEdxdbikWi3mlep
         AdQG8BkJnM0RvMv4EEyfK2O1+c2NQdqcSCWFrAo+DRjCYzZRnRn3XB4MRXUA6k+uQtmM
         4kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700870029; x=1701474829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FS/kIDFBzyqgGanxolvGaA4a07brcriqTmvix5/W40=;
        b=YO8lHqfDpPNSKG4XW1Dwf7GASwVOANVGWnvjEQUQufmWhK2NTknLJSnBQSr8gJohYK
         FqSL96f9KyWEb4DSBZtaa2Sp07580pJuRgkw9c3BbSQ/1bcuosSz3pFQpjUIuJ8K8c1E
         xegIubELSvGqV/OGEiSLfKryJz4rAGmGdTn//VdyXI2681fSPjnqcxa3wvVl+MCAsdaa
         MqoXJZn1oKzdYt/WZOqSDydeeSERhH9KP09lieMC9thv91R3xX3tY9uQKrajX9iknHRq
         0WF4XdGmu0Vm2MHLUa9drPTPRpBANSK0Xxw7x9N8ROrbt01MFdQG6//wqI977+48qvsT
         YC8w==
X-Gm-Message-State: AOJu0YzpxuJJ+YJ2expEIzX0Sc/fm2iquHq7U32Libaf9FwP1qxw5CTP
	EOYCijKva7I+H4Wa0q61cufb/5puvO10C75/Sn1Flg==
X-Google-Smtp-Source: AGHT+IH68YNNs1mdIZPfOGd3BfU7yWO4f5ZEZ2LHNlI3qHeYAMd7J1NbAfruVBibbln969jG6/nSz3dpLoNuc455+D0=
X-Received: by 2002:a0c:eecd:0:b0:679:e7dd:fa9 with SMTP id
 h13-20020a0ceecd000000b00679e7dd0fa9mr5108187qvs.10.1700870029271; Fri, 24
 Nov 2023 15:53:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-18-peter.griffin@linaro.org> <ff91f9e7-6018-402e-935a-c9fa10ced9fd@linaro.org>
In-Reply-To: <ff91f9e7-6018-402e-935a-c9fa10ced9fd@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Nov 2023 23:53:38 +0000
Message-ID: <CADrjBPqNTKHjh=QR__Jdw-Ht5z0NcB3j92dtjFJJS=A1AS9jQw@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] arm64: dts: google: Add initial Google gs101 SoC support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,


On Thu, 12 Oct 2023 at 07:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> > (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> > phones. It features:
> > * 4xA55 little cluster
> > * 2xA76 Mid cluster
> > * 2xX1 Big cluster
> >
>
> ...
>
> > +     gpa10: gpa10-gpio-bank  {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +             interrupt-controller;
> > +             #interrupt-cells = <2>;
> > +             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> > +                        <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +     };
> > +
> > +     uart15_bus: uart15-bus-pins {
> > +            samsung,pins = "gpa2-3", "gpa2-4";
> > +            samsung,pin-function = <2>;
>
> GS101_PIN_FUNC_2

will fix
>
> > +            samsung,pin-pud = <0>;
>
> GS101_PIN_PULL_NONE

will fix

>
> > +     };
> > +
> > +     uart16_bus: uart16-bus-pins {
> > +            samsung,pins = "gpa3-0", "gpa3-1", "gpa3-2", "gpa3-3";
> > +            samsung,pin-function = <GS101_PIN_FUNC_2>;
> > +            samsung,pin-pud = <GS101_PIN_PULL_NONE>;
>
> But here it is correct...
>
> > +     };
> > +
> > +     uart16_bus_rts: uart1-bus-rts-pins {
> > +             samsung,pins = "gpa3-2";
> > +             samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
> > +             samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> > +             samsung,pin-val = <1>;
>
> Why do you set UART RTS pin value?

It's a remnant from the downstream drivers that support rts-gpio control.
I will remove the samsung,pin-val = <1> in the next version.

Thanks,

Peter

