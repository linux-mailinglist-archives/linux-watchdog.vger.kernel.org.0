Return-Path: <linux-watchdog+bounces-3175-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0CA753E6
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Mar 2025 02:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2428189B2C0
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Mar 2025 01:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B35A35970;
	Sat, 29 Mar 2025 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzn/Hixh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009D2940F;
	Sat, 29 Mar 2025 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743212225; cv=none; b=mO5VmHzywdpLYabKrQ/xkudq07ppDICqkxpsKiHW8RThtEfOLIp6UAyX7QeWHCLLp0S8WxWlkh9stVOz0cAO0OLB9BMEdEnVZM3S/LzVNFfX5eCt92wVMaSONud4bJyuFq4v33Z/lnDb5S8pE2HE+ThkCHs/xQvv3FDlTy3jyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743212225; c=relaxed/simple;
	bh=AEGkd/T+++fTkI+0PWDV+7VHoIu42JovBtOhzZmLmYY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MztR6d3kqUurVQO47nHtw5fYOVzrQYKNpZ+rLToB/H1i7gSqzAmksNWpePfP5IMz5d4BPDt5f1NspyGMqP0DXMj4M8F0/Lcg0AAGsfEvXUgCnOmND2Mkl6iwrqNfXxkG4uLTAEdulmLLeTv7nAXnmHsCy3HN0+0o4nDm5wMgmHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzn/Hixh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FAEC4CEE4;
	Sat, 29 Mar 2025 01:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743212224;
	bh=AEGkd/T+++fTkI+0PWDV+7VHoIu42JovBtOhzZmLmYY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Wzn/Hixhr00W282gN8wMfNXVqujyRBD/N1zXVNfwQhUYT0JD77S5LkNNDcuc+azP+
	 gLuS3nZketikuMV7Vif76r992Ut6hOP7lwyxMMRDRXVxzrHq+cm4/dRIneXcCivGvA
	 fIBua5rXlj9n75KVn47EyIAjU7KtRvjcyv7ledw3ioRD602WGeetiEvJmMNH9j4FP9
	 dalINg8y2ydVsWsO8O6QmpQgpFcn0yBR5ZLzNZq0QbcLYdB1BbggK5azbXXv6CGqeb
	 1gpCqzisWJNYRGb/WWQQV/CLLqcJSdSZD0YUAb7hvlxbLBTtWqFYa5f6PrkFLKqPS3
	 YZpb0/l0m0ZTg==
Date: Fri, 28 Mar 2025 20:37:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, linux@roeck-us.net, 
 Thomas Fossati <thomas.fossati@linaro.org>, linux-watchdog@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, wim@linux-watchdog.org, S32@nxp.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
Message-Id: <174321222207.2172829.15350189767926637719.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer


On Fri, 28 Mar 2025 16:15:13 +0100, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/watchdog/nxp,s32g-wdt.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dts:18.29-23.11: Warning (unit_address_format): /example-0/watchdog@0x40100000: unit name should not have leading "0x"
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dtb: watchdog@0x40100000: 'timeout-sec' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/nxp,s32g-wdt.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250328151516.2219971-1-daniel.lezcano@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


