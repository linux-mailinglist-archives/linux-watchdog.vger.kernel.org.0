Return-Path: <linux-watchdog+bounces-3192-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152DA79583
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 20:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8706A1883EED
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 18:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4631DDC00;
	Wed,  2 Apr 2025 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGqamARA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2071DB92A;
	Wed,  2 Apr 2025 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620196; cv=none; b=Ay8WH50Qnn0ac4lAlsZaADv0G3JNc2HedEop3LoabdJiwGXb0bBoGmly6Htay5+9juJZkM1vqrm0JJZt4CE2RVjaANr6bU7WEFK5XVU/6SbY0z+wfk8YxRkD2ybB3zt6C9dbpM6Biz2MQzBuFhbgPgELUpc4OU4Fcbm/6KXOVNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620196; c=relaxed/simple;
	bh=xmznKTQXjh7m9NClIWACppmUCWNDHM2Fnwfp/mZYh6A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SNJQp3wQGBpyp/qLi+Tm0Wy7zjBNHoYpYOBRtFM4WjapL43pCqskhEbn4a9l0QpSmD975Idx/UEdllNuuTMpfodGuoEo2GdqdZDG+dSZQnm8ENyOirENhlO6wdSR/sJuUEmPxdLlGX/T0yUJ6wBBsqZqO1oYFLSBBMYEaxrjQWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGqamARA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BFDC4CEDD;
	Wed,  2 Apr 2025 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743620196;
	bh=xmznKTQXjh7m9NClIWACppmUCWNDHM2Fnwfp/mZYh6A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VGqamARAY3FnSJ1x5qs7X/OPBN/OpQ0Ta2ueXCo5bQ8PdUmmeJ6+czpzt1198ht0R
	 1Q6iRYdLqBLZiGHeB83NXgMyVlEdlZ1XWX+IFU+R4jKiLHziNwF8NlbVzo+Ficb/Ol
	 VxAGgO5rFBN+7idluRIu5vxeDCknUY8kweQ72biok6Z29e8IqoXljRUr3dPO6Gbz+Z
	 QRz9FUAWZjJrH9FC67w/h5ltxZP0o7vy7z/C6Fi+qtsmGi1oufS2X1Lt3uv3p5nnUx
	 k/i4nmJ0LKLlNVeK14g58NzXu3sey+HCJtu34U9PVUAc2m5v3zL2djhO9BUrhL2dA0
	 AcqJxL9YXtUrg==
Date: Wed, 02 Apr 2025 13:56:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, S32@nxp.com, 
 wim@linux-watchdog.org, krzk+dt@kernel.org, linux@roeck-us.net, 
 conor+dt@kernel.org, ghennadi.procopciuc@nxp.com, 
 linux-kernel@vger.kernel.org, thomas.fossati@linaro.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250402154942.3645283-2-daniel.lezcano@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
Message-Id: <174362019496.367085.18177836404576070514.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software
 Watchdog Timer


On Wed, 02 Apr 2025 17:49:39 +0200, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/watchdog/nxp,s32g2-swt.yaml      | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml:17:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml: properties:compatible: [{'const': 'nxp,s32g2-swt'}, {'items': [{'const': 'nxp,s32g3-swt'}, {'const': 'nxp,s32g2-swt'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml: properties:compatible: [{'const': 'nxp,s32g2-swt'}, {'items': [{'const': 'nxp,s32g3-swt'}, {'const': 'nxp,s32g2-swt'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.example.dts:18.29-23.11: Warning (unit_address_format): /example-0/watchdog@0x40100000: unit name should not have leading "0x"
Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.example.dtb: /example-0/watchdog@0x40100000: failed to match any schema with compatible: ['nxp,s32g2-swt']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250402154942.3645283-2-daniel.lezcano@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


