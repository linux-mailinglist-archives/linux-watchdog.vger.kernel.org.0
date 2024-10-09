Return-Path: <linux-watchdog+bounces-2145-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22900995C2F
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 02:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930D7B21C50
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 00:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8973207;
	Wed,  9 Oct 2024 00:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPU4g917"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72615C3;
	Wed,  9 Oct 2024 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432845; cv=none; b=esnSkEfb7a5dc+jiKdQoBpFVQCtBL6j/IGgfCCUyLjmIXrEuxnPmD4tNpOunpYVNaHDLU2ZMAay+dXAeXddmNqBHh3JDgZYB2yHbgtNMzsMGmYT68slPprMPCfdu1lyDAca7mPkrn6v+zjChsOoh05fa8Z6B18u/1AsEuPK/Psg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432845; c=relaxed/simple;
	bh=jYBcePMOOYkg5tEtoXYzFxitT+4jY9HsX2bHokdM62E=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=nQOeV2EbghBkzQkIW/QOv/UQCNVQ0rnk0S3t8jeqgvsiCXOvjUOOAQvh0VRMwX4hq3eY+hk4zUJTLGtd4eoUwXZ/XukpSI5qCsmpT+v4C3JnRUHlfGB3INLCtRo5duZX2lsl+VF1jkszHx7JmIEo31jabzIlL1ENc471AjLM1sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPU4g917; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3ADC4CECC;
	Wed,  9 Oct 2024 00:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728432844;
	bh=jYBcePMOOYkg5tEtoXYzFxitT+4jY9HsX2bHokdM62E=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dPU4g917C8K1h2uicf2COFv02iBL7fa/ggyQgvefoJFRGCDaxIg8+HeDXc3U+Of6d
	 WQF84R3lK7shGBkxKYjWN/E6rZ/6cyr5wJdGVeUcW09KdYZrEOBQhITOfgW+I6tyxf
	 SBvx8dRJ774/WHEk6AxUBms2Ln1uq6wAVhiL1fO+pM4+o9clKV4xNrxW+r70/bnjIz
	 vKOkmk2izqCNK7/vYYj45K/X9TNOaGRwauAMCGry8KTHQkTSAYFrfVwBFpgK8zCTg6
	 b0bjmrI4c3fXvJxQGvU3GB8nnbsEMNE5o5dWjurSTkvyXvWUiHuU1VwH6s9tNS2rJv
	 gWstub7c0C4Ew==
Date: Tue, 08 Oct 2024 19:14:04 -0500
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
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, linux-leds@vger.kernel.org
In-Reply-To: <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
Message-Id: <172843284141.2657712.2409161838083716200.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml


On Tue, 08 Oct 2024 18:00:58 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
>  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 23 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


