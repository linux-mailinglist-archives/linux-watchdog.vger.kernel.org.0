Return-Path: <linux-watchdog+bounces-2188-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D0999AFA
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 05:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 470A11F21669
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 03:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6C41F4733;
	Fri, 11 Oct 2024 03:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQhPoMzW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE759EBE;
	Fri, 11 Oct 2024 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616275; cv=none; b=rEznibibmuW4guNtMFfjsb0Hua1xN36bSa3um8yA7PirM5LquL3rDdhhPwXseV00KiYLHLNjyvfnJH+pdkmzJnjLHuJMCBmTbzDIcWogfwl9l5f2nj7jvU3plGozAbC8aVvUugis69YHGeROhf+OP8PUa2gLMGe0rOtl5vvWFdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616275; c=relaxed/simple;
	bh=/Is7oWoyxrLieInLOs7YT+uoBTtaioJ+iCMHS+28m4s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=jKQmjZyjGwxawL1rk5VXw1kMHNC3bVtx1JjA2e6QsmrlYHs7b8rUrAjtpKwOSP6nc/ZK4UA2UZ7WRPeryEMTNSOTu+Y48Ii2Ljba2okEKg9CtaUZoFF7Qu5pzzda32NNicjlWx2vEcd1oX61XdctnY0oHEZziGtOQi+Pyot7VzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQhPoMzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6473FC4CEC5;
	Fri, 11 Oct 2024 03:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728616274;
	bh=/Is7oWoyxrLieInLOs7YT+uoBTtaioJ+iCMHS+28m4s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eQhPoMzWy+8mZcr6AqdoEhJQ2JG3QFOjkZqiAMY3UCc9ocKoGVvKRaZH7K95KfGgH
	 cw1QMpcCienCzG42y2tNFPSEl4pFAh0okp7/8znTfHwIl8RzEF3E7TLd9Sd4QwVrFB
	 ACtTdRD8ivYtHDtQU3x3XYLdb2UDGYxudrH/YGgJC2diml20/DJyGUsFLEQncFlrO0
	 txiXgX5WsCu5wwwKTQLPeEiTtT0US0CC31qmTiOcbRPmbhl3ZU5TigntIxxfSPnFhw
	 HcD2qQD9wf+rlGZI+akwh2skB1vf92KF6jO8xwcNigSiVywwHHFUJVw60Jjqu3Py73
	 pCsPg9VnwbF/g==
Date: Thu, 10 Oct 2024 22:11:13 -0500
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Pavel Machek <pavel@ucw.cz>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
Message-Id: <172861627193.2232781.13972900744363458830.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml


On Thu, 10 Oct 2024 11:42:39 -0400, Frank Li wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241010-zii_yaml-v2-2-0ab730607422@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


