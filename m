Return-Path: <linux-watchdog+bounces-295-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BB810876
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 03:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE49F28212E
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 02:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FD91C2F;
	Wed, 13 Dec 2023 02:58:23 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F9AB3;
	Tue, 12 Dec 2023 18:58:18 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5C4C924E254;
	Wed, 13 Dec 2023 10:58:15 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 10:58:15 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 10:58:11 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: <conor@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<jisheng.teoh@starfivetech.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<leyfoon.tan@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<samin.guo@starfivetech.com>, <wim@linux-watchdog.org>,
	<xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add compatible for JH8100
Date: Wed, 13 Dec 2023 10:57:59 +0800
Message-ID: <20231213025759.812453-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212-shout-bazooka-714aeda42ec1@spud>
References: <20231212-shout-bazooka-714aeda42ec1@spud>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Dec 2023 16:47:59 +0000
Conor Dooley <conor@kernel.org> wrote:

> On Tue, Dec 12, 2023 at 04:46:00PM +0000, Conor Dooley wrote:
> > On Tue, Dec 12, 2023 at 11:17:31AM +0800, Ji Sheng Teoh wrote: =20
> > > Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> > > watchdog.
> > > Since JH8100 watchdog only has 1 reset signal, update binding
> > > document to support one reset for "starfive,jh8100-wdt"
> > > compatible.
> > >=20
> > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > > ---
> > >  .../devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> > > | 2 ++ 1 file changed, 2 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > index 68f3f6fd08a6..02572b16ac08 100644 ---
> > > a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > +++
> > > b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > @@ -27,6 +27,7 @@ properties: enum:
> > >        - starfive,jh7100-wdt
> > >        - starfive,jh7110-wdt
> > > +      - starfive,jh8100-wdt
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -45,6 +46,7 @@ properties:
> > >        - const: core
> > > =20
> > >    resets:
> > > +    minItems: 1
> > >      items:
> > >        - description: APB reset
> > >        - description: Core reset =20
> >=20
> > This relaxes the constraints for the existing devices, please add
> > per compatible constraints to avoid doing so. =20
>=20
Thanks Conor. Just to clarify, are you suggesting to add what was done
in v1?
v1:
https://lore.kernel.org/all/20231209142723.2060196-3-jisheng.teoh@starfiv=
etech.com/

> Also, you do not appear to have implemented the request from Krzysztof
> to express compatibility with the jh7110.
>=20
Ok, fix that up.


