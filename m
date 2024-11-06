Return-Path: <linux-watchdog+bounces-2416-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39C9BE0F2
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 09:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB694B242B1
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0EA1D5171;
	Wed,  6 Nov 2024 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="WGVIyQNV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8991D432C;
	Wed,  6 Nov 2024 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881723; cv=none; b=i4At6ulHotBSTeIRSTGX2qE6G0HCcOqc0RAt6LpWPqI3i/uUordl6Wir5Nq8czQn5WdWP1sjhdDmpEfSmX1DkLlAMUFFGwmdN5F40+OGkNncZBgBoZBlwIgdi9JvVaBoZZEofhBfRtbFJjFjClzVmYH42tc3lRNBkm9BZEDy550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881723; c=relaxed/simple;
	bh=1ciSStcfRdIZHSbpIwhHEGxTT0wF9Oowtv8x1fEmb94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDXjVDqj7JLfEgnkC7kIe3NbtqwmQAteo70UKSx+Qg8J/aFtgtrULy7yymcfE1i/NR3NXBapYC/2Ck5IloialOo7rHcegM2XaZFg/FJI/oyCQwwndFjysdXcOMh9PkvmToQHH49hwAvMjZNuO29sUB5Sqt8AQreih8iICYhId9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=WGVIyQNV; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 0AEB0409F8; Wed,  6 Nov 2024 09:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 0AEB0409F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730880077;
	bh=1ciSStcfRdIZHSbpIwhHEGxTT0wF9Oowtv8x1fEmb94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGVIyQNVE53GZ5mr6L5/ZU6VZbFLmazGh1e0WUij7oyHfxHe9agTPk45KuhcSSIpz
	 CMrr7Zro60keW3uAMqVBr55ikkycyg33vy4Tb3V/yACs4SC3zM4AXyZtkVgmmN3cLE
	 yLXsmajfkar3cMZSgq3hPzkUGOFLVYKnsysYzWew=
Date: Wed, 6 Nov 2024 09:01:16 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Li <Frank.li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <20241106080116.GA14302@www.linux-watchdog.org>
References: <20241007212434.895521-1-Frank.Li@nxp.com>
 <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
 <20241105083255.GA24194@www.linux-watchdog.org>
 <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Frank, Rob,

> On Tue, Nov 5, 2024 at 3:00 AM Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
> >
> > Hi Frank,
> >
> > > On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> > > > From: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > >
> > > > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
> > > > allow big-endian property for ls1012a and ls1043a.
> > > >
> > > > Fix dtbs_check errors.
> > > > arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
> > > >     Unevaluated properties are not allowed ('big-endian' was unexpected)
> > > >
> > > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > >
> > > Wim Van Sebroeck:
> > >
> > >       Any update this patch? Kyzy already acked.
> > >
> >
> > Acked-by: Wim Van Sebroeck <wim@linux-watchdog.org>
> >
> > Via which tree will this go upsteam?
> 
> Your tree.
> 
> DT bindings go in via $subsystem tree. I only take DT bindings if they
> don't get picked up by the subsystem maintainer.
> 
> Rob

Added.

Kind regards,
Wim.


