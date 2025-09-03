Return-Path: <linux-watchdog+bounces-4165-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B6B42A95
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 22:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B65D682928
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 20:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66632F068E;
	Wed,  3 Sep 2025 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ+TeRN6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AB1F0995;
	Wed,  3 Sep 2025 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756930421; cv=none; b=dpWPhf+ZCrMBv3ILclf132BhRzXIvkNvchOKGJM6lP2V4jKjuIDb1t/EYOvC6M5ox6UMkocdb0VCJcSToQFYgchdK7X3AUk/4NL60L/cs+ID3nlx+yOeSsJW3gloq4QvzPjLdS2aHgdVASn0ffC+3ZnonOOjEpLyHYBDWe62Wlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756930421; c=relaxed/simple;
	bh=J2qb1Yu8Pz7kKZZf5TZpKTCw/Es9BAR5tzLOrc3w5Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjEREn5JzUo/9hWUw/yuNNwe8ZX0k9gAWw1o45XWuAdGS63kF6zstTOT31MbAID4coYn8J3lo2tCYeMSGHvulCgpl1SACaFdlVvWZcsCovY5m3tr4bETpMjwjzM+yxPTEO8SRRDQNb1svW9+eRzPttRafvmzpJxD4CJ54lfDG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ+TeRN6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6983DC4CEE7;
	Wed,  3 Sep 2025 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756930421;
	bh=J2qb1Yu8Pz7kKZZf5TZpKTCw/Es9BAR5tzLOrc3w5Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQ+TeRN6MxTTThV8moBNq53GSsQ2T7yp+5bH+8n5qjKFNR9SQH7gHdh+GXye1bZtZ
	 qR08zoB3fK+kv8DHS2+SzEqZ5gFxYrsFOaookwrbtbRobW2OQBsj8uEIg/fpmQAgmC
	 TxJwREPlPkzG4RtL2L6BHS80GHAWtIEyGc4Vl7gMV4rLpLmIgEcvXUXaxoL7Wxmhq4
	 Cs722Fk/Be++nWyev9i1fg9qscDBJNMyer61V98SbWOfaTNyJZ05qNt0JYdj9D921e
	 Et2nmDHIgdE4UgcQQaThV2Kv9vUCjbfMMf7CIeXZ4fGpLhWxYhnQXe0yUvxPtXmWxP
	 pjo5ZQg9mNjeA==
Date: Wed, 3 Sep 2025 15:13:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <mfvuoslj27mbayypzr3wuagrq3p5wzelklgveedhwrxiaavwxy@7ipv2tup6oou>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>

On Wed, Sep 03, 2025 at 07:34:00PM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> Add driver to support the SMC-based watchdog timer provided by the
> Gunyah Hypervisor.
> 

Start the commit message with a problem description, end with a
technical description of the solution. I.e. move this paragraph down.

> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available. Depending on the hypervisor
> configuration, the watchdog is either fully emulated or exposed via
> ARM's SMC Calling Conventions (SMCCC) through the Vendor Specific
> Hypervisor Service Calls space.
> 
> When the SMC-based interface is enabled, a device tree overlay is used
> to provide the pretimeout interrupt configuration.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
[..]
> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
[..]
> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
> +
> +/* SMCCC function IDs for watchdog operations */
> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
> +#define GUNYAH_WDT_PING       GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)

Uneven indentation.

> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
> +
> +/*
> + * Control values for GUNYAH_WDT_CONTROL.
> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
> + * then the watchdog is enabled and vice versa.
> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
> + * it's expected to be 1.
> + */
> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
> +#define WDT_CTRL_DISABLE BIT(1)
> +
> +struct gunyah_wdt {
> +	unsigned int pretimeout_irq;

This is only used momentarily in gunyah_wdt_probe(), make it a local
variable.

> +	struct watchdog_device wdd;

Which means that gunyah_wdt is just watchdog_device, so you can drop
gunyah_wdt completely, and put wdd directly in drvdata.

> +};
> +
[..]
> +static int __init gunyah_wdt_init(void)
> +{
> +	return platform_driver_register(&gunyah_wdt_driver);
> +}
> +
> +module_init(gunyah_wdt_init);

module_platform_driver(gunyah_wdt_driver);

> +
> +MODULE_DESCRIPTION("Gunyah Watchdog Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/gunyah_errno.h b/include/linux/gunyah_errno.h
> new file mode 100644
> index 000000000000..518228e333bd
> --- /dev/null
> +++ b/include/linux/gunyah_errno.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */

Isn't this content solely used from within gunyah_wdt.c? Why is it a
separate header file? Just move it into the c-file.

Regards,
Bjorn

> +
> +#ifndef _LINUX_GUNYAH_ERRNO_H
> +#define _LINUX_GUNYAH_ERRNO_H
> +
> +#include <linux/errno.h>
> +
> +enum gunyah_error {
> +	GUNYAH_ERROR_OK				= 0,
> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
> +	GUNYAH_ERROR_RETRY			= -2,
> +
> +	GUNYAH_ERROR_ARG_INVAL			= 1,
> +	GUNYAH_ERROR_ARG_SIZE			= 2,
> +	GUNYAH_ERROR_ARG_ALIGN			= 3,
> +
> +	GUNYAH_ERROR_NOMEM			= 10,
> +
> +	GUNYAH_ERROR_ADDR_OVFL			= 20,
> +	GUNYAH_ERROR_ADDR_UNFL			= 21,
> +	GUNYAH_ERROR_ADDR_INVAL			= 22,
> +
> +	GUNYAH_ERROR_DENIED			= 30,
> +	GUNYAH_ERROR_BUSY			= 31,
> +	GUNYAH_ERROR_IDLE			= 32,
> +
> +	GUNYAH_ERROR_IRQ_BOUND			= 40,
> +	GUNYAH_ERROR_IRQ_UNBOUND		= 41,
> +
> +	GUNYAH_ERROR_CSPACE_CAP_NULL		= 50,
> +	GUNYAH_ERROR_CSPACE_CAP_REVOKED		= 51,
> +	GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
> +	GUNYAH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
> +	GUNYAH_ERROR_CSPACE_FULL		= 54,
> +
> +	GUNYAH_ERROR_MSGQUEUE_EMPTY		= 60,
> +	GUNYAH_ERROR_MSGQUEUE_FULL		= 61,
> +};
> +
> +/**
> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
> + * @gunyah_error: Gunyah hypercall return value
> + */
> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
> +{
> +	switch (gunyah_error) {
> +	case GUNYAH_ERROR_OK:
> +		return 0;
> +	case GUNYAH_ERROR_NOMEM:
> +		return -ENOMEM;
> +	case GUNYAH_ERROR_DENIED:
> +	case GUNYAH_ERROR_CSPACE_CAP_NULL:
> +	case GUNYAH_ERROR_CSPACE_CAP_REVOKED:
> +	case GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE:
> +	case GUNYAH_ERROR_CSPACE_INSUF_RIGHTS:
> +	case GUNYAH_ERROR_CSPACE_FULL:
> +		return -EACCES;
> +	case GUNYAH_ERROR_BUSY:
> +	case GUNYAH_ERROR_IDLE:
> +		return -EBUSY;
> +	case GUNYAH_ERROR_IRQ_BOUND:
> +	case GUNYAH_ERROR_IRQ_UNBOUND:
> +	case GUNYAH_ERROR_MSGQUEUE_FULL:
> +	case GUNYAH_ERROR_MSGQUEUE_EMPTY:
> +		return -EIO;
> +	case GUNYAH_ERROR_UNIMPLEMENTED:
> +	case GUNYAH_ERROR_RETRY:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +#endif
> 
> -- 
> 2.43.0
> 
> 

