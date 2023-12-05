Return-Path: <linux-watchdog+bounces-125-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BD8804BDF
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 09:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38C9C281817
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 08:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975853BB28;
	Tue,  5 Dec 2023 08:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NovNhaNJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37BD127
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Dec 2023 00:09:31 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c09ba723eso24750545e9.2
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Dec 2023 00:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701763770; x=1702368570; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llS7f6J05UN7P4lvcEDyZPRcCQQD6OrCb5vmd5KnD6k=;
        b=NovNhaNJA+SnPPI73/BoAabx2HN750hvhgCJnOAVlA+oUxyJ9H7qrS6xGtYEHlcxhd
         SF7qGVO9MKRrXzy1W39Quo7RG4xmHAa/yb6ytvbMso8r44MW6dftf42ucGGo5a00TVBq
         TTRG/Kt9I+Xg0vniAXutsgI0U6UlN9xhJ+EWrVGNvIk80CB9on2XyeyiLbiQejYa3FUD
         y2L5DfmmTpRhJxetO1qiZ76d7NuLPGUE9tP7lpJMd9Fslv76/FJGFEUl/In98tNZP2tX
         m1no03AoI7PRa5l3jVwau0oYrZXnDit2VtBAz10Fm2pDCaP7FXAom57nTf9VzyIz0eCg
         cvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701763770; x=1702368570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llS7f6J05UN7P4lvcEDyZPRcCQQD6OrCb5vmd5KnD6k=;
        b=u3UCkWbTkOcfJSAXltEGLpRR8ursAdksLYp/f4/Jlk3Fcsvh8aPkHB3KNaUkIxXQS5
         ywZRIivj5tn7pjPG2nCW7CC3kYPsIPeQv+x+gjhJtq95hhnsmVmpR+IFtAPc7LFSLqqa
         IeshcdJeBF26G+OQdsn9B2LuRrC7VOV+662pez5WV7Xvev7YzpE0tWCtgbb5tOLApMBH
         kPayNaXEPtvfpl11nMR5N3BhVVzL+ABJSpHBHJlpUf1GHDCHpBeI1BTmoKVkAr9xh7yk
         IqppSafrlQrnLYIiiVgYc+fU6zKrBWOjdQx3SU5C5fElfPhvPxFrOO1lNU6MgCT7CfRH
         5qhg==
X-Gm-Message-State: AOJu0YyfmAvpLnUfLEnwbNt7gOkAVukU9fgNU4BS/LynS14mxCbZJ+zR
	zsTbmvHQBQ/TNhFrtn1iRxy0FA==
X-Google-Smtp-Source: AGHT+IE+8qnIaRvP5U4oIVPqun3EKI7fA5pnVF2X2zE0apGVGOOPaI86NDaJpz7xHPp+qNxo2AQwbw==
X-Received: by 2002:a05:600c:2146:b0:40b:63b0:e0b5 with SMTP id v6-20020a05600c214600b0040b63b0e0b5mr195357wml.224.1701763770352;
        Tue, 05 Dec 2023 00:09:30 -0800 (PST)
Received: from [10.1.1.118] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c45c800b00405c7591b09sm17883711wmo.35.2023.12.05.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:09:29 -0800 (PST)
Message-ID: <860ca122a08bbce70b27d8880c621f0d12ddd2a5.camel@linaro.org>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, Peter Griffin
	 <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
  jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 tudor.ambarus@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org,  kernel-team@android.com,
 linux-serial@vger.kernel.org
Date: Tue, 05 Dec 2023 08:09:28 +0000
In-Reply-To: <CAPLW+4nAwWBHkAe2Wg2b+URsgN8ienPh14L=Fu8PUxf4gxq0ow@mail.gmail.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	 <20231201160925.3136868-13-peter.griffin@linaro.org>
	 <CAPLW+4nAwWBHkAe2Wg2b+URsgN8ienPh14L=Fu8PUxf4gxq0ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sam,

On Fri, 2023-12-01 at 16:40 -0600, Sam Protsenko wrote:
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >=20
> > [...]
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x20b8
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x20bc
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_I=
PCLKPORT_HCLK=C2=A0=C2=A0=C2=A0 0x20c0
>=20
> As I understand, all those parts like IPCLKPORT, BLK, UID (RSTNSYNC
> probably too) -- they don't really mean anything in the context of the
> driver, just noise. And if you remove those -- there won't be any
> conflicts with other names, because those bits are not the unique
> parts. Following the TRM letter for letter in this case just makes
> things extremely long without adding any value IMHO. For example, that
> name above might be:
>=20
> =C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GOUT_APM_SS_DBGCORE_SS_DBGCORE_HCLK
>=20
> or even
>=20
> =C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GOUT_APM_SS_DBGCORE_HCLK
>=20
> would be fine.
>=20
> In clk-exynos850 driver I removed all those parts, because they make
> it pretty much impossible to read both the driver and dts. And yeah,
> because those names consequenty lead to very long string names, dts
> will be hard to read too, which is even worse. But again, that's only
> my IMHO.

The advantage of keeping the same name as in the data sheet is that then it=
's easy to
correlate between driver and hardware and future / other hardware.
By arbitrarily diverging from the TRM you make life much harder for yoursel=
f when you
have to look at this again in 12 months time after you've forgotten your na=
me mangling
approach; you also make it harder for everybody to review the driver or to =
use the
driver as a reference in the future for other hardware, as nobody except yo=
u knows
what kind of name-mangling was applied and which register (or clock in this=
 case) is
really meant.


Cheers,
Andre'


