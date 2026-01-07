Return-Path: <linux-watchdog+bounces-4768-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF415CFEED4
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 17:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1331B33D72FA
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 16:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5F038F920;
	Wed,  7 Jan 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG00nZ88"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974DB38A722;
	Wed,  7 Jan 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802988; cv=none; b=fGv8NTmjFa+ztCvgqNTE29993Vb3s7gfR8gQBrlRExXTkNTVAmRWrZhpc4vmmK0FQ9fFTyIV7xVC4+okvuff5UEuZ0lVn4HgMUSHTfcqa8fBoBTWo8gF7P1jNYyl4n3Zb9mcGuwFrnBnRBmlg4VrWr+xD9zTE4XFXYt3J1gQWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802988; c=relaxed/simple;
	bh=FFIQuHOhYK1i7JOLF5zZxrsqMoQslXgJmOhYGT5ng/0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=U+riAa06hwLox9WBAFudI/SBcvEeBpcuKNb8oIoEBYrzVIdpFrctq8u4i4iCjCfKjV0itbDIqJNPc5hePexsfpMswW3E26S8o4IgrHHgkDC5CALQupT1CZmS5airhMaZ5yTHdV9jp3A3x6Ey1U1NmLaOycXzZ1fZv9gRnA28zvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EG00nZ88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048A8C4CEF1;
	Wed,  7 Jan 2026 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767802987;
	bh=FFIQuHOhYK1i7JOLF5zZxrsqMoQslXgJmOhYGT5ng/0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EG00nZ88+71WwSWv0NLRO0H5HZj/HWqys8KxhHU/qMEEKrojjjCu5OoK6Auz3WRMf
	 rZd/vH/f3cAx878AsVNbF8ZnO4lIszHOGo5qobnGygxgwUXfSwasi82scaT1CsVkXp
	 +Fu8UIKmHQ3wiVAnBvBsYl6RxiZbrwy39f+1nATFHprldvv7Rf5L7yx40WXKwOaZsn
	 YVrwspAOezQ5vIC7fwVTTsRCrTIyeQRMxQXrsnPBgKsLF9lshMUS/WlLLEns8cqIlv
	 fRv5u1GW+NHTi9dLdvvmCMYEx00hj0Tl7HbFW/uy62fzkOHJfCjfyVnWU1Wgsgz6l2
	 +xkmqr/1lRnGg==
Date: Wed, 07 Jan 2026 10:23:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-watchdog@vger.kernel.org, 
 tim609@andestech.com, linux-kernel@vger.kernel.org, wim@linux-watchdog.org, 
 linux@roeck-us.net, conor+dt@kernel.org, devicetree@vger.kernel.org
To: CL Wang <cl634@andestech.com>
In-Reply-To: <20260107145058.213334-2-cl634@andestech.com>
References: <20260107145058.213334-1-cl634@andestech.com>
 <20260107145058.213334-2-cl634@andestech.com>
Message-Id: <176780298619.1372056.364291942804232671.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Add support for Andes
 ATCWDT200


On Wed, 07 Jan 2026 22:50:55 +0800, CL Wang wrote:
> Add the devicetree binding documentation for the Andes ATCWDT200
> watchdog timer, including supported properties and usage examples.
> 
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---
>  .../watchdog/andestech,ae350-wdt.yaml         | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml: andestech,clock-source: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260107145058.213334-2-cl634@andestech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


