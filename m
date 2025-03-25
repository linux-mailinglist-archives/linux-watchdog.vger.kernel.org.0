Return-Path: <linux-watchdog+bounces-3138-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFDA707E5
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 18:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD913A9138
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 17:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA8013633F;
	Tue, 25 Mar 2025 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="FohdKXo1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19F19F487
	for <linux-watchdog@vger.kernel.org>; Tue, 25 Mar 2025 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923146; cv=none; b=oYxBwlmqPCmjWjnc0fui88ynW5E3ydme7o4YKbGVGl2w8/VhxjalWcP3+eVC+jxlZs1DaVbrPzZs7AnM4sxlNMUz/18kB7xko8BaNJCR8Gdzs6ae3NZKpohQpF9AG5HxOlqpluc62brpB5GdKwPBbib7EjzAWaxA0NTyXa77ORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923146; c=relaxed/simple;
	bh=89snBsB9hv5wlyxcY5446+E9mav+e9ltF9Zpa/H/XPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCZda3SjHppbaCFfctr1bmGNPJ/39/lWv7r8okficzLa+1Ly19i5RavilSPAAS5jpw3amtTQ3yZPk+QFBk7qbPlALPHYfPaUdzsJMYw3P7CCCAPkAablEqJodJzcaMTcK4XPwxBy0iNyC/X6WEbk6OaZMsr0+SwCjpJMcOwPPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=FohdKXo1; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202503251718552b62f3efd959248127
        for <linux-watchdog@vger.kernel.org>;
        Tue, 25 Mar 2025 18:18:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QjB4n1CG5EJajMUvXPSpBjvTs6+Sq6WL3daydtuzFKg=;
 b=FohdKXo1wbpag0EuxImEwOgHoN3ANC9mC3AjpYk3r6eCB3TXgUt1AaNnHSe14b+QINXieV
 Hxj/LOWVtl4PF/1qjNe/wnRF2MS26XvXAzNAv6uP0vr9R/Xiz8CPGKWLGVSNoyIGo6KGNHyI
 DKSJqeIMN55rKf0Kq6jnfbcNTTf56Cx8JPPD6b1TuCniNn0k2NtwdPxBLMQpOhdMNg33Hnzn
 4SIZ1SuWlwhYxKfQo231Ci+OLxplf4pBgqSlQUr8QgG1HUFBEN18uAqysm3xIE5Ye4oynq/5
 OPMa2Z3hUqrkFS4JgDlNhEUxx82ciCDq1jDWovbxcDhGF8sagia3gJeQ==;
Message-ID: <1beeb77c-83d6-4634-ba39-2b40efbb8437@siemens.com>
Date: Tue, 25 Mar 2025 17:18:52 +0000
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] ACPI: PNP: Add Intel OC Watchdog IDs to non-PNP
 device list
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jan.kiszka@siemens.com,
 benedikt.niedermayr@siemens.com
References: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>
 <20250317-ivo-intel_oc_wdt-v3-2-32c396f4eefd@siemens.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <20250317-ivo-intel_oc_wdt-v3-2-32c396f4eefd@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer

Hello,

On 3/17/25 10:55 AM, Diogo Ivo wrote:
> Intel Over-Clocking Watchdogs are described in ACPI tables by both the
> generic PNP0C02 _CID and their ACPI _HID. The presence of the _CID then
> causes the PNP scan handler to attach to the watchdog, preventing the
> actual watchdog driver from binding. Address this by adding the ACPI
> _HIDs to the list of non-PNP devices, so that the PNP scan handler is
> bypassed.
> 
> Note that these watchdogs can be described by multiple _HIDs for what
> seems to be identical hardware. This commit is not a complete list of
> all the possible watchdog ACPI _HIDs.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@siemens.com>
> ---
> v2->v3:
>   - Reword the commit message to clarify purpose of patch
> ---
> ---
>   drivers/acpi/acpi_pnp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_pnp.c b/drivers/acpi/acpi_pnp.c
> index 01abf26764b00c86f938dea2ed138424f041f880..3f5a1840f573303c71f5d579e32963a5b29d2587 100644
> --- a/drivers/acpi/acpi_pnp.c
> +++ b/drivers/acpi/acpi_pnp.c
> @@ -355,8 +355,10 @@ static bool acpi_pnp_match(const char *idstr, const struct acpi_device_id **matc
>    * device represented by it.
>    */
>   static const struct acpi_device_id acpi_nonpnp_device_ids[] = {
> +	{"INT3F0D"},
>   	{"INTC1080"},
>   	{"INTC1081"},
> +	{"INTC1099"},
>   	{""},
>   };
>   
> 

Gentle ping on this patch.

Best regards,
Diogo

