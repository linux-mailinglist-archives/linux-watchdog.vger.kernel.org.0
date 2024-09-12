Return-Path: <linux-watchdog+bounces-1879-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D997736E
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 23:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68995285255
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 21:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D884413D89D;
	Thu, 12 Sep 2024 21:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3DtisiN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F1F47F6B;
	Thu, 12 Sep 2024 21:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175732; cv=none; b=TmQXRK+fC5tmereQncJARWWVkiuFKo+Zbj4jo7JfNr3FW9rwgKmuAAGACDMTK5WVwKlyPyc02gMFzIwMLenkrgrsbOA5psUJkSU4U9RAj1qylCRNO/K5Tyj/EIKiP+pLfujWC6XrfaHCiAsaMk+cRs5SAXR5uLduq14q8/OyMJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175732; c=relaxed/simple;
	bh=wMPYDYysoFZiJ766A+fh1ZdAOcmlOQDl31Z1qyrEItA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhh6aYr7WWZFBen1LwpNAwU1AEfL++aUULtTt6h9/q/kApfflCYeVsDb5KsD2yqBYE6pZAwiWVIkJIjUAaNnTbzhC28qCMaP6r0LhfSoVQpjOdSO40ZN4eZSTVn4NWNYRSTNTdwf/9IikMelBBr6DOA4ZZppDewPologBAzMXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3DtisiN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7d82b0ebd51so60753a12.2;
        Thu, 12 Sep 2024 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726175730; x=1726780530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rlDPMDhjaiteUhjBR6Ca8ZvyPrmOqcDT4erUYA/SjyQ=;
        b=l3DtisiNm8nlsFVMz/71q0j4m3nDQSUwLQUFqg6E7agu4Q2fZfwKPiF2SuXMVRP42Y
         sqpu5GR7QZwLEYHvB1LYv8fOxaGBFEkQbgqnjgBoUzi64tUbaXu5Mpm5jgJL7iRxAao2
         KghwhjBOhQjF3WVZmm4kybCt8OT/wTWukZgdNpRrpwEoxWJhXMQ5aaO5z013CUhT9NC5
         BxH21p/9r//CE5xtZ1yvXE6y+Mv5FO9YDtKfWhXXyyOjTVfsaDcnNgcA/csY47vo5NZe
         uu0sH/QizdtKO86eJS1Xu3Sk8bVNqnNpxxsvkK63Rr0WHdQkkjBFBB3CwzG0FrLEMoNw
         gLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175730; x=1726780530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlDPMDhjaiteUhjBR6Ca8ZvyPrmOqcDT4erUYA/SjyQ=;
        b=KMKXzjlfiyxFHBh4q61vCJDRR1dKBpX2Z8Rv6pUBPNulN/99ECn59//3E99V3V25Iw
         CkCbigFidT96gbn991ba5RHWtS4ovh4y5ypk4xYt61rkf85WfhV+HBFZB65en86ZniYj
         HbK7IJgz4ledolI4tXPfvGT6c1XaKcJNJ3hTlm40dLvLpUwH87S5bx33Wnc+1t3Wck/r
         VNCYOSqyPuxj0+cv90X7Ke5NC9FJvMR39XQbNuZJXwWYmHiSMMaMtZnxUXlKaT62zYp5
         JSn/ok5YoRFBeBMGXyY2yT3UPI6jGO87HnncpJGoZ7+SANipuL7WU2Z0xM0Q80Dvh+NV
         LbLA==
X-Forwarded-Encrypted: i=1; AJvYcCW7nBU0zJROhKVzrjOF3uXSL8+/VbWd2yvMcWLm4BfQqWjt0qGgPwJlgRaP0vWF0vQVlKgG0Q2+11igDlM=@vger.kernel.org, AJvYcCWzQ419eWaAEhXL0WMa/2E8NkDfPZkapLbAFafE6Ek/7LVIYYVAAnPPeXMDLzfolqfD2E07uTgc2oc0WDTnydw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFlDGhefx2TlsSFQ1NCN3xJPWaCuW5QXl+xy700AxMvH/6o1Ly
	ifissEME/YiXEOzRSW3xVu6JbLpLFuORaGOUA/p+lsIINw73igKZ
X-Google-Smtp-Source: AGHT+IHAS9/+STmVvGWl2H7IBrE9yd2yXTA7hs1PhBGtHNPwJkovgL4Hrus2zyfGAD/g13t6FVbN8A==
X-Received: by 2002:a05:6a21:e90:b0:1cf:6d67:fe5a with SMTP id adf61e73a8af0-1d112edc9b4mr598350637.50.1726175729994;
        Thu, 12 Sep 2024 14:15:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba402esm2169020a12.16.2024.09.12.14.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 14:15:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1ac5e79b-f313-44aa-a19c-dca05574ba91@roeck-us.net>
Date: Thu, 12 Sep 2024 14:15:27 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit()
 call
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: jdelvare@suse.de, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, mika.westerberg@linux.intel.com,
 wim@linux-watchdog.org, wsa@kernel.org, xe-linux-external@cisco.com
References: <9afcde72-6720-494e-9a02-b0089253c121@roeck-us.net>
 <20240912141931.2447826-1-oocheret@cisco.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240912141931.2447826-1-oocheret@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 07:19, Oleksandr Ocheretnyi wrote:
> Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
> PCH iTCO") does not mask NMI_NOW bit during TCO1_CNT register's
> value comparison for update_no_reboot_bit() call causing following
> failure:
> 
>     ...
>     iTCO_vendor_support: vendor-support=0
>     iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
>                                      disabled by hardware/BIOS
>     ...
> 
> and this can lead to unexpected NMIs later during regular
> crashkernel's workflow because of watchdog probe call failures.
> 
> This change masks NMI_NOW bit for TCO1_CNT register values to
> avoid unexpected NMI_NOW bit inversions.
> 
> Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> ---
>   drivers/watchdog/iTCO_wdt.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 264857d314da..46c09359588f 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -82,6 +82,12 @@
>   #define TCO2_CNT(p)	(TCOBASE(p) + 0x0a) /* TCO2 Control Register	*/
>   #define TCOv2_TMR(p)	(TCOBASE(p) + 0x12) /* TCOv2 Timer Initial Value*/
>   
> +/* NMI_NOW is bit 8 of TCO1_CNT register
> + * Read/Write
> + * This bit is implemented as RW but has no effect on HW.
> + */
> +#define NMI_NOW		BIT(8)
> +
>   /* internal variables */
>   struct iTCO_wdt_private {
>   	struct watchdog_device wddev;
> @@ -217,15 +223,24 @@ static int update_no_reboot_bit_mem(void *priv, bool set)
>   static int update_no_reboot_bit_cnt(void *priv, bool set)
>   {
>   	struct iTCO_wdt_private *p = priv;
> -	u16 val, newval;
> -
> -	val = inw(TCO1_CNT(p));
> +	u16 val, newval, mask = (~NMI_NOW);
> +
Unnecessary (). Either case, please just mask against ~NMI_NOW directly.
The mask variable is not necessary.

> +	/* writing back 1b1 to NMI_NOW of TCO1_CNT register

Standard multi-line comments, please.

Thanks,
Guenter

> +	 * causes NMI_NOW bit inversion what consequently does
> +	 * not allow to perform the register's value comparison
> +	 * properly.
> +	 *
> +	 * NMI_NOW bit masking for TCO1_CNT register values
> +	 * helps to avoid possible NMI_NOW bit inversions on
> +	 * following write operation.
> +	 */
> +	val = inw(TCO1_CNT(p)) & mask;
>   	if (set)
>   		val |= BIT(0);
>   	else
>   		val &= ~BIT(0);
>   	outw(val, TCO1_CNT(p));
> -	newval = inw(TCO1_CNT(p));
> +	newval = inw(TCO1_CNT(p)) & mask;
>   
>   	/* make sure the update is successful */
>   	return val != newval ? -EIO : 0;


