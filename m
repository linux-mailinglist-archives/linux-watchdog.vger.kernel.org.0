Return-Path: <linux-watchdog+bounces-4166-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD935B42D5E
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 01:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7F716E796
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 23:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092512EBBA3;
	Wed,  3 Sep 2025 23:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ldlah4M3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58731459F7;
	Wed,  3 Sep 2025 23:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756942064; cv=none; b=pxh/C4ogpp/TQEzAFown9/9HsbDqaveH0GkMo66d6ZwLWDLBFFt7TgkTbqJGrWgCiaaY7sM91fowMgB1JGHqMDgSG4z9W9OirMu7hGcasOPCLvZb4aOWxlUSlLvqmE0qiETDrm5mtlw0q39pWptRxhh5FZg1C1xfl2OYIvwbk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756942064; c=relaxed/simple;
	bh=AEj1ut4nnqnWq24GOBtJDcvtfSaWbvakcSXdhfDlddc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sqW20m9uOUWDwJLgHFLg+toC4Kl9OMv0P2oCPf4bMFbt6jamrFzYiaQ+gxR1Awwc20/cpbAvfRt8jQUx+snLIssk2rJEOBe9NOVErv+jaq1oO3/wQO+jXx34Mk1QEoyHsFK0ddLXQ3nqcXSFE9L1Ed8XhUAZT4KH05SR7QljNd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ldlah4M3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FE8C4CEE7;
	Wed,  3 Sep 2025 23:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756942064;
	bh=AEj1ut4nnqnWq24GOBtJDcvtfSaWbvakcSXdhfDlddc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ldlah4M3xYRMQ13HGwDjqjTnbdq1rH2Hf83aVgmMBJE2e8SBpBNadUH74xRZY+n2Q
	 naR8MdrqP1CJVqRxVjpaPUC+zz3b5qovCMnK8sC1Rh2LgjoVSuEcfOd+0bk8lvE4ir
	 IkMSbVk+DoWBx8Si/PCGMy8mfXyVKclVwdASCUvZgZcy3LStrtBOtEZwv0Ewoq3r4H
	 VMhHkGCmIz3qFTZcdN1yenEcvyW/M6mTjUpTsrO2IaITxcsUiHygyI6dCSoCJ17s2X
	 mnPFQQLu+hdhlYQVZ4G/59Llwy+MHfG+V/djLSD45qIVp3iCNAXQ8vOhSsrl/HA1m/
	 ppZf8LnETO2yQ==
Date: Wed, 03 Sep 2025 18:27:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
Message-Id: <175694204303.3260042.16528672909501752752.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add binding for gunyah watchdog


On Wed, 03 Sep 2025 19:33:59 +0000, Hrishabh Rajput wrote:
> The Gunyah Hypervisor applies a devicetree overlay providing the
> pretimeout interrupt for the Gunyah Watchdog that it will be using to
> notify watchdog's pretimeout event. Add the DT bindings that Gunyah
> adheres to for the hypervisor and watchdog.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  .../bindings/watchdog/qcom,gh-watchdog.yaml        | 76 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 77 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.example.dts:37.3-38.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


