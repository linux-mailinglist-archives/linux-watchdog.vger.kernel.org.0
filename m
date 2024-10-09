Return-Path: <linux-watchdog+bounces-2146-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCF995C31
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 02:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15F4628624E
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 00:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D3136D;
	Wed,  9 Oct 2024 00:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiUkj4qM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F876FB6;
	Wed,  9 Oct 2024 00:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432846; cv=none; b=CXCM5VPqA/g2kvAPXqmViJxDOS1XacGPAS0eSLeN5YbVvdL6Oqs24EMUvwjWvn8eMfvC+zdv/V7nSeErfpCxY6ieB4JYIs0T52/dfKDAA4JV+HH9Hwsbt8IvXHfhkEgdXssekNyFwf88aJ5K9Bq3roB+18vhBk+nX8mYAbljzRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432846; c=relaxed/simple;
	bh=E4VZjjRDfN+lhZZkbKwkkKuro9DYs1y1+b1/HbjnHI8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=gV/jSPFhvFHpWr46BcgteGTglJNnap8OZMBmzJWMdgrCCVuahSU/kh61WqzrBVopKAMeB4beUg2cg0xD/pXUcBEiXHVkxrgTx1ucKbMdKeXKc/Psrz+lWTzNN2iNRtF3d/w/4PPAQ6WG0jGPC3xk/7qQkMCNengHAVu4qWJ3McM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiUkj4qM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C43FC4CED0;
	Wed,  9 Oct 2024 00:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728432845;
	bh=E4VZjjRDfN+lhZZkbKwkkKuro9DYs1y1+b1/HbjnHI8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=DiUkj4qMgM52IWkz+RMubs33FfZ4zJSQeVQMXLQ/0xbv4JFXLDfmhJ0Ojl1Qame0Q
	 kIA+JAuqwOhaLuieycJGEtObjWhC9zhCkhd/74yNWyUeMh/8u3tPWPScpxYaYeTQh3
	 Ek6EiWmFANvRdrYAdeE1LYhTK4tNd901hIOYY6fGP6jrvtfvF3rE5+68hwP8e0wHWh
	 zFC3dYiaUmXpnNBOo0ogWJ8W7EXt5Vwvq70+NkZzbNX48/AJ0pXIEFgFs+dUNU9Ivk
	 2yFOuePvCbBJAGwo6hHlLuPdv6DGSiuyaiIn8qHaHCXATu95sz5E1kpuLsIo55TsXs
	 RGbwVBi0muz4w==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com>
Message-Id: <172843284230.2657753.15437804090200858713.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt
 to yaml format


On Tue, 08 Oct 2024 18:00:59 -0400, Frank Li wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


