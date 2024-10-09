Return-Path: <linux-watchdog+bounces-2151-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61025996F03
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 17:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 228A4281E9B
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 15:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA94B1D0E38;
	Wed,  9 Oct 2024 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRIhHAqw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66011A2562;
	Wed,  9 Oct 2024 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485968; cv=none; b=VQpwO2/cBexytBSLWJceQE04VBDw1FOQ+PLj8YU71joZX4evNHWkoFE0Cjm6dt2IbarCT0CWXvBLXALGPKMs+OAkz3g3iAqbDGvJYXfUe4XqrnSBl62G4NNqx39kTNfGPICgrWYNqpEzLrcBmKq06ep68IL3cNXf6/rXlStnYaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485968; c=relaxed/simple;
	bh=S6Oq4Cl8cwV10b0MxDD4bAzcwNwphys1J9zfQElXCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2C2oEAjdJv86zCyXyy2vAfwViv11VSQAc9BkqjEdzG72YdbIZBQDBRYAjUrygufmfneJpkF1lxHuwMY0xjTt11nBSdLVcvTz4JyCCr4r91QAgAboMkXnvDZCtKbEaDdClnwwCB8rQWka+Vq0YC5c1r3xmmpd3xjqlGslVLEDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRIhHAqw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA065C4CEC3;
	Wed,  9 Oct 2024 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485968;
	bh=S6Oq4Cl8cwV10b0MxDD4bAzcwNwphys1J9zfQElXCyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRIhHAqwqrFRZMBMrJ8ebfmFCYfPNCaYkn0ZEfGd+KSfij9Ja6LDL8c1srGRiIL6n
	 0gDKIiNZRsLhzYLn9AamZuybBKkZCqSN/OlHzVWrpoICRDSL2yz0yYPl5u1fCVVA6l
	 RuAuKZKeX61vurd3ZuKUp+iAhH4VWFPnMeVRuPUlFQs9rmTvgcwFsFHoRGd4iXUz4n
	 P2cwhU/MER6we8GpOc9pPt/SsqJCz+EdwOUgY1x+OEdI2P0bEcsSSIYoQzTe1mLoWW
	 63uNUdUrh36rDgVc/lgWO7MELr0GKDOH0Rnw55RtsuE/+VLYsfin+NRnxC4Fa9GXk4
	 vzuUgINcAavNQ==
Date: Wed, 9 Oct 2024 09:59:25 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <20241009145925.GA465237-robh@kernel.org>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
 <20241009142758.GB16179@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009142758.GB16179@aspen.lan>

On Wed, Oct 09, 2024 at 03:27:58PM +0100, Daniel Thompson wrote:
> On Tue, Oct 08, 2024 at 06:00:58PM -0400, Frank Li wrote:
> > Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> > Additional Changes:
> > - Remove mfd parent node at example.
> > - Ref to backlight's common.yaml
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
> >  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
> >  2 files changed, 36 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> > deleted file mode 100644
> > index ff5c921386502..0000000000000
> > --- a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
> > -
> > -RAVE SP backlight device is a "MFD cell" device corresponding to
> > -backlight functionality of RAVE Supervisory Processor. It is expected
> > -that its Device Tree node is specified as a child of the node
> > -corresponding to the parent RAVE SP device (as documented in
> > -Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
> > -
> > -Required properties:
> > -
> > -- compatible: Should be "zii,rave-sp-backlight"
> > -
> > -Example:
> > -
> > -	rave-sp {
> > -		compatible = "zii,rave-sp-rdu1";
> > -		current-speed = <38400>;
> > -
> > -		backlight {
> > -			compatible = "zii,rave-sp-backlight";
> > -		};
> > -	}
> > -
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> > new file mode 100644
> > index 0000000000000..fe9dba8231bf1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/zii,rave-sp-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Zodiac Inflight Innovations RAVE Supervisory Processor Backlight
> > +
> > +maintainers:
> > +  - Lee Jones <lee@kernel.org>
> 
> How did you arrive at this maintainer list?
> 
> It's not the usual backlight group and it also doesn't match the
> maintainer for the mfd bindings.

It should be someone that has Zodiac h/w, not backlight maintainers 
either. If we can't identify anyone then maybe the platform should be 
removed.

Rob


