Return-Path: <linux-watchdog+bounces-4511-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 115FCC30D9C
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 13:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77359460608
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4632C21E6;
	Tue,  4 Nov 2025 12:00:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158B5242D87;
	Tue,  4 Nov 2025 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257631; cv=none; b=lEgY4S4kW1NjnZtH46HRMb5bFzOoLjoOGFO+a7SvRuuMcIcZwO43Xpkv+OQNJlmR8qCFfq6ea4ND8gCwD+q2lhGgm2dtq7ahI8Go1YBkM8pLXxvuCFw/zhKJs4G49ta6xmGRduOGrl6ViVlc9gpM99ARU4p8fYQBU0kgIlBF27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257631; c=relaxed/simple;
	bh=Q8gFBcSOjeRlHIiQA+JpMm4+zu0c2QWMdPQLvZHe0OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUxa3dVgQBa3G4gj9+/seMeTuKVz69OEFLyVb/wyOeQ+tOl4eUGwarfrhb6lQgPn7IY0jo94wS90fzMgog/GaWT1GRJfD1sCP9LSIMDODRCx/EUzMPhgmv+K8Ng9PSorYPr3y2G4NrP5FeFlZvDrsdVzNUlI/d2QE78m/oPeFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05CE1CE0;
	Tue,  4 Nov 2025 04:00:20 -0800 (PST)
Received: from [10.1.38.131] (e134369.arm.com [10.1.38.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 605273F694;
	Tue,  4 Nov 2025 04:00:27 -0800 (PST)
Message-ID: <0e6b0f23-0f4c-44eb-892d-e6785c5767ac@arm.com>
Date: Tue, 4 Nov 2025 12:00:21 +0000
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] watchdog: sbsa: Update the W_IIDR Implementer bit
 mask to 0xFFF
To: Naina Mehta <naina.mehta@oss.qualcomm.com>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104063937.839138-1-naina.mehta@oss.qualcomm.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20251104063937.839138-1-naina.mehta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/11/2025 06:39, Naina Mehta wrote:
> We noticed that the implementer mask defined in the driver [1] captures
> bits 0-10, whereas section C.4.2 of BSA specification [2] indicates that
> bits 0-11 of the W_IIDR register represent the implementer JEP106 code.
> 
> We were hoping to understand if there is a specific reason for using
> 11-bits in the driver implementation.
> 
> Looking forward to your insights.

Well, looks like a simple off-by-one bug, doesn't it? And nobody noticed 
because it only affects vendors in the later JEP banks, and the only 
user so far is comparing with 0x426, so it's not affected.

> 
> [1] #define SBSA_GWDT_IMPL_MASK    0x7FF
> 
> [2] Implementer, bits [11:0]
>      Contains the JEP106 code of the company that implemented the Generic
>      Watchdog:
>      Bits[11:8] The JEP106 continuation code of the implementer.
>      Bit[7] Always 0
>      Bits [6:0] The JEP106 identity code of the implementer.
> 
> Signed-off-by: Naina Mehta <naina.mehta@oss.qualcomm.com>
> ---
>   drivers/watchdog/sbsa_gwdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index 6ce1bfb39064..80cb166582df 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -75,7 +75,7 @@
>   #define SBSA_GWDT_VERSION_MASK  0xF
>   #define SBSA_GWDT_VERSION_SHIFT 16
>   
> -#define SBSA_GWDT_IMPL_MASK	0x7FF
> +#define SBSA_GWDT_IMPL_MASK	0xFFF

Can we please use GENMASK here? This probably would have avoided the 
problem in the first place.

Cheers,
Andre


>   #define SBSA_GWDT_IMPL_SHIFT	0
>   #define SBSA_GWDT_IMPL_MEDIATEK	0x426
>   


