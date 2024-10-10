Return-Path: <linux-watchdog+bounces-2181-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDEF998ED0
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 19:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2856286425
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 17:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C547B1CEE9B;
	Thu, 10 Oct 2024 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onqp1m+C"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6241CEAD8;
	Thu, 10 Oct 2024 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582632; cv=none; b=X9hyhNItcfTeyakLQSUYVnQ432JxkOOCe1pQm8CX5ttA8+nsoMw1OPYWDnytXjFAkNWjCoItP5bK5lyK9qa8aBK6lfD2qpkCRzXY1YRL+hgfVnNdNolGRlVcbAzg2pxDsfWlZCs+X7dJRwvM9cneYu/Yo0vukoOnerMQbEheNbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582632; c=relaxed/simple;
	bh=e2ct8EgYpnqZZr08HUKWQNGYtu2nQSXbY5wl+rtsE68=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=pjfkFkAI439wVZtV/Yj3SIoekhMRTsHbvpULhZVbgjMZ+gKOx8HAjjFG94+2vjttRWiKfwgl+UeCaHwWj0D9Bv/j/FgWNBk4UMghCHBLKVYrpxhQbsLsNSWrpT//mqbkeMhLwe4EjOno7gwQzC3FBd2AlXrHgYhBK0fvet+Zzws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onqp1m+C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9055C4CECC;
	Thu, 10 Oct 2024 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728582632;
	bh=e2ct8EgYpnqZZr08HUKWQNGYtu2nQSXbY5wl+rtsE68=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=onqp1m+Chu2s1rdECvnyt9l7leioNL/SHAyciVnS7UgPGlOzCzm4LRSr/KGp2CA80
	 UbMdYz/LBwjiptaVhPMSO6PiRtMqVxlRPIy321HsN4bjyNCIRMGfvi6G911FTVjSgq
	 NIonrIRb31X4hFA3XAQjUSqTQtyy1qnYhRRBqISpqx8VA3RMETZHtjO0oQJzVlE6AJ
	 BJhckatk2ze9cOZw9ZBOMf+DGPiJyi2Ir7h/UoW8GTYRcCmUsIdPVqKl6B0wFJgFP4
	 a8YoHthkLecJLEm8ZPchjoD/gHEjGeZpcMXZp+LO62MblsHBOyhjqAd/DWw7q6lqX1
	 hf3LrRI3OkIIA==
Date: Thu, 10 Oct 2024 12:50:30 -0500
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
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-watchdog@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
Message-Id: <172858262752.2080943.12465101127692480556.robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: convert
 zii,rave-sp-wdt.txt to yaml format


On Thu, 10 Oct 2024 11:42:41 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp-wdt.txt to yaml format.
> Additional changes:
> - Ref to watchdog.yaml.
> - Remove mfd node in example.
> - Remove eeprom part in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ------------------
>  .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 39 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241010-zii_yaml-v2-4-0ab730607422@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


