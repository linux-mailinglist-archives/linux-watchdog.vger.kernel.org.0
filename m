Return-Path: <linux-watchdog+bounces-4960-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO4PDsa/m2no5gMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4960-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 03:47:34 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE044171783
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 03:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70D7E3045C1C
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 02:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805552773FF;
	Mon, 23 Feb 2026 02:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTW11A8H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A16D274FEB
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Feb 2026 02:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771814646; cv=none; b=LmfylnA4n0kOQ/ns5WJ+DML/wOBXVhSokRFh5W+mEndTXGtRUsVSDjcfqqTWTfXDC3vo0+2aKghLlOXxI2NP2ZiDP3xKfV0pizRWBgw4TyPdDl3SEb/rmXRtCwJOWzJI0MturQFM3QWY7ll+SaSnTr9flSbQOEVlDi2eUt0TN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771814646; c=relaxed/simple;
	bh=61JI1iFg+jKjBEvKJsC56tZR2dUE2n9IGStsfLmIzjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnYLMPCCOZzi/YgkXp+5+dgsShZcuh9qlzXtnq8Qq+0iwVbMqLvYFq6sFH2CL+LH4f0QJ0ZWCx7Qi+Vu33e+IDUIu1pEgE1TV1C6UkpnedUJhCGR4i1EcClIdY35uZgGfIPKHD2Rt05EhTJOIA78CT60GgsVBdOHnIoMEIe2ElI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTW11A8H; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1270adc5121so4367736c88.0
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 18:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771814643; x=1772419443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUGyrOCiFKmd22m0e9WBSJK1+CmCBY8C+Ml8xJYW2Ds=;
        b=PTW11A8HAy3XqMp106zN4KJ6FE7lAZhhk4ME9d+GWntQsnZLhceUT0o2wAoiAZQ8kM
         /6fW4LkTs61fKf0UgfQuF0cRYB2kmmE1eTMAMTTfag73HP3hup6Vmcki+oJnjAfALN9V
         YG8FcwebsRw7kujNX+xisCCkq9NIkrM5ngCdf08UYv+3eaVztm6ES/tmAz3HtKB5Whs4
         NDu6zF9LmjqgDHeX83gaJR3T7D6eE3BjvsPPR5ActnEvyIgw2wgLig8h1ZVuMjD+cBny
         +6kMsFfhQVDKIgWr4Ff80oOpDZFIpwZFzP3MQWhS9cnwpBSJrCQlPU29f0MkKMjlNcw3
         6Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771814643; x=1772419443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUGyrOCiFKmd22m0e9WBSJK1+CmCBY8C+Ml8xJYW2Ds=;
        b=dFslWQTztUcJlRKWywrL1Ykac5mpjs0kWTw5CkkTDROF/V7vb4TKsH9ellWhT7N/wu
         AaVi+Ly5nEa5dbDit3+qkKr5fdoQKsSFxw/J4tJ0PGH6T0SmrdEmp9zOxQ6+31KZP70p
         SpVQbG/hKX/JLuGTr717iVWXwIN4Wpf9vsJF0IpR3thgPf9H9v+tkDThwbPij/gkBdhM
         3UX3exDORHSQYeSxh+Dhc1SDPd+BgWnB1viSp6xAnjvy121y5RfB9vDQVwv5f4Qvpvno
         oHHBrMrnS5O2BMyEsXWM8JNc3jigbdkSFpp/0COXc69dO1YTr2wuQpBag+F5TJ4Vxjlj
         Ty2g==
X-Forwarded-Encrypted: i=1; AJvYcCVRq13SiFnHRo02l0J5JV+HgdwIlBZKgdGvgA/1HEiMMz7h301qW4LCa2Z2/QD80RVXdEuf5dGvcnMEug+YaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyloHA0G4oiC2prlEIasiQeATJi47QntZAr0e0c4Swum/b5KpbA
	bMx3TKoo6FHS6rZmlibz+KbjTwtifPsxx2bjwwXgFPwooUU+MdZOW+QV
X-Gm-Gg: AZuq6aLkzR/lnw3i2+Ko/NvBEPID0bTL2RC3YtDAoWKKcK2Jzj+JSgXU4NcivXl7JWT
	1lsaoc5yzO0orA0KVSGN2IlfvJHHTCocmiXdVDxdn9WXMeTJ/01PVSbAJ6yWtlbOJHugzPctKsT
	jAUAfz9OLBzstX20ai0N38oHoaBwiG+Cp3P27oqpSz9C99Q0dzYEGinEaBaXklpQm3KCapoNuFn
	OAmp8vZzl0J6FlmspuZzDvbIVU3E0bO21IfvtWo2rBolm2E067P50mEoVzcFTZpkrJHO2vUwtNO
	Ad9P0eBSMrAthjgtvXp9LCoK6Cm39qZbxAXcgFyO0EX7zQ1kcnnVAwu0NbFhPmG8AiPPjXTEC7X
	ys2MttQwnTbXuIkHpWZyOs4uUHbwJmm5wUJ7Lu0yf4LUtiLIdfE+PgKGpmT9xEgDyg6wrH0+3o2
	AagyPUAuS6LCMhvskYGfH5n7kDdRvQ/mnUzoet
X-Received: by 2002:a05:7300:df09:b0:2ba:7b63:3f6e with SMTP id 5a478bee46e88-2bd7b9e70a2mr2900744eec.11.1771814643308;
        Sun, 22 Feb 2026 18:44:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc16203sm4067919eec.27.2026.02.22.18.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:44:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Feb 2026 18:44:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Masney <bmasney@redhat.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: pic32-dmt: allow driver to be compiled on
 all architectures with COMPILE_TEST
Message-ID: <deaf8776-3672-4c93-8e74-79a643e5238d@roeck-us.net>
References: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
 <20260222-watchdog-pic32-v1-2-a2538aa528d1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222-watchdog-pic32-v1-2-a2538aa528d1@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4960-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE044171783
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 06:24:17PM -0500, Brian Masney wrote:
> This driver currently only supports builds against a PIC32 target, or
> with COMPILE_TEST on MIPS. Now that commit 0f8a61ca78d6 ("watchdog:
> pic32-dmt: update include to use pic32.h from platform_data") is merged,
> it's possible to compile this driver on other architectures.
> 
> To avoid future breakage of this driver in the future, let's update the
> Kconfig so that it can be built with COMPILE_TEST enabled on all
> architectures.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ec20bb80bdd5eb9b4852ffc8150e7999a42f7635..105d08ab8715be8712877b8d5a0fbfd0038fb049 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2024,7 +2024,7 @@ config PIC32_WDT
>  config PIC32_DMT
>  	tristate "Microchip PIC32 Deadman Timer"
>  	select WATCHDOG_CORE
> -	depends on MACH_PIC32 || (MIPS && COMPILE_TEST)
> +	depends on MACH_PIC32 || COMPILE_TEST
>  	help
>  	  Watchdog driver for PIC32 instruction fetch counting timer. This
>  	  specific timer is typically be used in mission critical and safety
> 
> -- 
> 2.53.0
> 

