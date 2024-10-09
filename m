Return-Path: <linux-watchdog+bounces-2144-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C41B995C27
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 02:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDEA0B21728
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 00:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8295ECC;
	Wed,  9 Oct 2024 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="divIMHKw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EADA383;
	Wed,  9 Oct 2024 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432844; cv=none; b=QkhQB819eWPEzG2x9IfJJVQ1phuKX/b/aBP/6E8D58E37AxO1ODf1vdH/snQujm7ToZGkQAFumCdeJxQYsR3amQNRwIdxpHWMx5oPqK+rmFLseWvJBU3bkeTtHKW/Zg2hKJGrOfQHE6dtuANXtWMRT/mbo9djYotk/ponC+rHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432844; c=relaxed/simple;
	bh=ISowwB8V/w5gps6MY3LRCF12ElijfALxRi3ED/Ocfr0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=DmSk2aomuDFbxoPtnp8QQN2lqSUbh43TFQLkiL1tvwiYxfuru72qxMt9tLEzFuaojDpd/TcjA67/xQ9ciNegxvnEvXm5ocpsoUqqdJYZO/ms5gAKYqGcZ/Ywf6flPDDl4BgPdeKN7wGJvHN0UirDVsBy1d0oL6HHL+v+x2havNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=divIMHKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE58C4CEC7;
	Wed,  9 Oct 2024 00:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728432843;
	bh=ISowwB8V/w5gps6MY3LRCF12ElijfALxRi3ED/Ocfr0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=divIMHKwDCrk7iS1Bfp1xg/nYyUHq54TSX9moiIzilL8RNe6r2dcqf43qbm8MR/gQ
	 KGQKaGaVUtP8o+QQ5yxQu7+pPVrTQ8WLnvtV0bMZ58na4GgH9kaWvImxPsOiS6xJNG
	 M/nGcOgTdgQhnu/IuwzL28lijd52QrYKjs9wxctXAepXi6fPdALxIbGIlsTZN6DKsY
	 y084+ESg1lY1FXrKTURm2q8D9Ci6X/JTeHdWTLVLGClAcEnRU3VCgG3QPkZXahsSS1
	 tti5gffBklKZMMY8/QufSWCY8jpGGmaoZj3p9Zana36AbI+O4ARh4wtm4OLmd3tKVE
	 Ktb3h4Byd8sOA==
Date: Tue, 08 Oct 2024 19:14:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com>
Message-Id: <172843284049.2657665.7415620328802530234.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: input: convert
 zii,rave-sp-pwrbutton.txt to yaml


On Tue, 08 Oct 2024 18:00:57 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-pwrbutton.txt to yaml format.
> Additional changes:
> - add ref to input.yaml.
> - remove mfd node in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 -------------
>  .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 22 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


