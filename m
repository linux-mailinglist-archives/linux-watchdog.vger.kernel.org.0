Return-Path: <linux-watchdog+bounces-2147-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B4995C36
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 02:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBC71C21F4E
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 00:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B0818C31;
	Wed,  9 Oct 2024 00:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puEFSkBz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F061812B94;
	Wed,  9 Oct 2024 00:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432847; cv=none; b=MkpBlCAgqXvJuQWPjw/stZKNjhkt1qoUOCONIoK7T0CanTKeHuy539+gVarya8XuXv+zX3oNQ1Cj4IYETu6WhUW+ccbxZhQInng0OBSeNH6LhW9mHOox018Qz07Jj1+8+Jv3qlgTzIJzB0BOtKnz7+XA7UKlIcGzcCK1AHi6BZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432847; c=relaxed/simple;
	bh=0qjVzVNij6Q7rJVM+vtOkErT499UlI/yKNhtwMaoh0g=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=NIIjOJeEiuWbu2lHeM3ETUjAj3CsYqmecr+QGDfTry40LDcdgmF9EMBVON0JrU79xQn2HAGUvfxMCa/fn3DheVlrbSeGxC1ly3I3HlejXlWaxh06VLhlLUDD1YTMlZC804YWi5vd5K+imI8vmc8GPJlUPCpozZefgsEO9qetCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puEFSkBz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBB3C4AF11;
	Wed,  9 Oct 2024 00:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728432846;
	bh=0qjVzVNij6Q7rJVM+vtOkErT499UlI/yKNhtwMaoh0g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=puEFSkBzWgvk/zmDjShuQjw7OOadqpBUmWf4OlBffZHx4dN5tYkG86koRo6HSzM5T
	 LVfoSWEaHOTjUfucK8K/hxP6XkwEAb9wontZF9kKx0lhgsxfSHkPlRSdVQxYrBrpj5
	 tvSs5jDI51vWVrAmiMQtF0AApi+XQ0lwE7jaPeEaOhWxjxqlpHWug1kNpfMIjPDHqp
	 EG4h86navGeGQvgw2RASLujNDEzTZsyUyVZeGb0JMB15Fi6fcpKoUF5kH2e3zJ0kjh
	 vs2NQq6Q8dFvvkhLxI7pbsynPslRqwdCqXBDuSrNZfvrN1fWGkeA8l1yAdDnru5qyg
	 1PUiG7mlxJJAw==
Date: Tue, 08 Oct 2024 19:14:05 -0500
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, linux-watchdog@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com>
Message-Id: <172843284314.2657793.15106714372363156953.robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: watchdog: convert zii,rave-sp-wdt.txt
 to yaml format


On Tue, 08 Oct 2024 18:01:00 -0400, Frank Li wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


