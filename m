Return-Path: <linux-watchdog+bounces-2180-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E1998ED1
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 19:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9FFEB287F9
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 17:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145901CCEC5;
	Thu, 10 Oct 2024 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTj2IpU5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66E11CCB2D;
	Thu, 10 Oct 2024 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582631; cv=none; b=keFQI5GbIYVHSYeRS9JXwvwIcjCA8zKkQP2QT7fmnb9NKIVUaYJxUUO40TeZ1E/yFRDhgD0djODkd2c8gM37WgZgh8QepgZEDws8Bxd4ehYIZvJEgxDKKEtY4X6WtV/hf4WH1vYEuNc30DnWmD6fTsB9+LVUevCzvoP3thC+8g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582631; c=relaxed/simple;
	bh=znAwk9LvdBaIxUgsfJ7psEYr+KBG3HpzUpw7dUbSeuA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=RAtllJft74iLFzM3mpPo/tjojk7PwzQp0jgjPWCvGeQQs3w/ya5uNEyMN/axH2Mv/DHGT52kkByNEPQYcAW55yHNlyvDieuvC1I8wioV7CcFgZrQZVMusMlTyUAREUYIEBCW878j64gNIIFv1MOgcx0mL5aI0P619Tw/zuyxmVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTj2IpU5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315A7C4AF0C;
	Thu, 10 Oct 2024 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728582630;
	bh=znAwk9LvdBaIxUgsfJ7psEYr+KBG3HpzUpw7dUbSeuA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uTj2IpU5FKe+QAmqAgi4nhI0KEE9Ge+q90dWm+lmMc1WENfebJZnhQWmW0PcrSKWO
	 EVLa4esoNS23vhgYo0nd9KP7MyeG/wDNvgSJpFgrGg1luD1Fv4OQNpMLc+83CKp81t
	 2NKjgJiSKatW9wUFZopFPXeoikeOabLz0Kr9IfRPkDl55VVhc7OKb9FeBqXt0eSDy0
	 pbI+SJNzQUvqnNiC6Q0n+gq3o9PpRh6XWfMm8WVVuSGsU/iVq0zqVNCzMdgict/8KE
	 xkbbN+S0zFepCCFbAfLmL5zVm1kEB6w0FP8yjxbxwWjJF9sMGoO7MHw8r57JtH9pp9
	 uX8wzgRDB0ZoA==
Date: Thu, 10 Oct 2024 12:50:29 -0500
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
 Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-leds@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>
Message-Id: <172858262476.2080877.11383908415848151284.robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: nvmem: convert
 zii,rave-sp-eeprom.txt to yaml format


On Thu, 10 Oct 2024 11:42:40 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-eeprom.txt to yaml format.
> Additional changes:
> - Add ref to nvme.yaml.
> - Add reg property.
> - Remove mfd at example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 ----------------
>  .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 40 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241010-zii_yaml-v2-3-0ab730607422@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


