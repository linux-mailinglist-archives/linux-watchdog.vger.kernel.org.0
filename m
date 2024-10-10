Return-Path: <linux-watchdog+bounces-2179-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FFD998EC6
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 19:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C67283712
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 17:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E8E1C9B93;
	Thu, 10 Oct 2024 17:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhpIXSva"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A841C8FB9;
	Thu, 10 Oct 2024 17:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582629; cv=none; b=YAQpMCuVE+ewmXmyePe7zgrRvmXrER9Z/iyn/kdBmNszB79LIl+6wWM4Bo1Wyc+fDCsJ7u6ZEjdU6D3XIuJm4JnQRswMJlaaZ5sj1uw13VJVPtBEJFsc1tBau3DV15UdUjvWkDj3cDt5cfOhJPjR6owz1BbYHuSF82rCkn4i6rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582629; c=relaxed/simple;
	bh=7drw4WHctnYvbMoyySTq1OnS4EX6OsZuazvZDG0donI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Gicu8rvfYiouQRsNlFIdxKL569M75a+AXIgUrrRTh1VvOD/fDRtJyVrwkE0+FJ9Bg3THE2DzHFa/uCDlDon+ZmIy6+MYOnq+aizqfA9dsHO4t+snHgTOl/20YxBCYwfOC83e/IympYPn/+Rsu2bSzxLNW+A4c+41ku13W5Lg9nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhpIXSva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C937C4CEC5;
	Thu, 10 Oct 2024 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728582628;
	bh=7drw4WHctnYvbMoyySTq1OnS4EX6OsZuazvZDG0donI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uhpIXSva0fcCHHS8aktFQSRnAlUGi+FKDeTeYIhopreh67zdnQGGY3vC/Gyw9D1el
	 Mb1mtMrvMBqJLSlwZ7J8JW16voggmzt3r2qNj2JoM0oaLN8ccRcjTNyBR2M7165eqB
	 DgLqVDD6EFCBOzBFyP8g0FsoA54C6LuUHaXBfBEVdihzNw30DY+urazJ2BXwQgpNiP
	 exwav4uzQETi74D4xSn4T9cWhfGYeZ4ZwDWjEoIOrkcPz9Mlbf1dJF7uU/6X4Ya0E7
	 8yC0wXaC75/pIDyiv4eInjBNV4bxIan142srcJbyZ215s+RRX/QtQgYUBwC5IwJ8s2
	 dLSdckL1VGTNA==
Date: Thu, 10 Oct 2024 12:50:27 -0500
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
Cc: linux-input@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
In-Reply-To: <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>
Message-Id: <172858262296.2080831.11191926901477789932.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: input: convert
 zii,rave-sp-pwrbutton.txt to yaml


On Thu, 10 Oct 2024 11:42:38 -0400, Frank Li wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241010-zii_yaml-v2-1-0ab730607422@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


