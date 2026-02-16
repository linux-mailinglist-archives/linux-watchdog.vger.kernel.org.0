Return-Path: <linux-watchdog+bounces-4948-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KrVE1c3k2mV2gEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4948-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 16:27:19 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48A1458D6
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 16:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CFE830151F8
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4808532AAAC;
	Mon, 16 Feb 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA8sHyoU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F033E32AAA1
	for <linux-watchdog@vger.kernel.org>; Mon, 16 Feb 2026 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255575; cv=none; b=P831qpuUJOPjxCpsaX6VFMx/DCJ5ORmkPRT/fKkFpDa3uNMvZ2KL6Zl5REm4w+O8gw+ckg8v8CWxPbOHba3p45BsHgTgMhQhm0zVyVbUO+dvfuWzGDShWLRvcqyEjIrqfzg3osQOpwgF347Ucgh+l95At/toZZR/6Tgcv/IhCcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255575; c=relaxed/simple;
	bh=IvIb1zg+Lc89a3qeO65yqaxHb3TlmL8e7T9TqiXkOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYrIKGD+wsEukYU2WDfs4pQU5JyGK4yU+BFvsLS2bW3BDrihYLIkb/CdGjgd+GFbF2Dty6PSmpRY2Qn3GqJYmQoJf69dtwPVceDC3Ds4RJoEJHE8afM/09iEwRokb0B0EW7yVSqOkgCU1Cw0CtpIVMjATj8cQmx9geekeNqFl90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA8sHyoU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a7a23f5915so17786765ad.2
        for <linux-watchdog@vger.kernel.org>; Mon, 16 Feb 2026 07:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771255572; x=1771860372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0L0LRV69FMCCwapk/tKlx7ALfhm9oqfw2MhnEs9iHQc=;
        b=KA8sHyoU2vgQXF5nPYK6qbpTps8AjJaEY4PTlVTVfuGyZMAOEcT4gaVCU9Pk8qtGIL
         7SnJ5ovdq96PNdKqUnxAfFZ/Nme+iwrzSYJaq6BAcM3CzdXpX58iBtA93KpWfF+p/zCB
         MvEntmASZ5SGiFN5/U/bA+zjOigH7MxUrlVGZqWri2djVRmT40qXB9JDgZPrgCg8l3K2
         BHoSL6yp2j2I6pRmlKFoRO/XX0JT7ZJPkyQMn9qMpLGfKWwNfLt770s6EXvYRhtGmrs5
         hhjZCOuW2NQoWwGxIpbDM4MZdK4wwE+pLQ9nc8NkwQ3XwqU1yU7dRQ0G8bHQ0OtCLip8
         7QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255572; x=1771860372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L0LRV69FMCCwapk/tKlx7ALfhm9oqfw2MhnEs9iHQc=;
        b=bEaG+cgGle9FAjsQ1baE/tP7kHmUzAaYP/AiYw5FN/x31Hna1gPjn6ktl2ycu5s+7g
         aVtbHM0VnDcYZ8qFxreXnZm1GgWxzKCcNk9q3YqQ5sahDsEkP3EfPLtpGt3l3lb3ipJr
         tmk+jyrBpcvk+94sPm8FFvCtQ2RkvvX1Djfm3ilo8q5xoMXh4zsud5z3Z2zSuBEtO8Bl
         EOc3L6O4UZyWfKwLRkBvNa4wAtUNmY/YmaByaWjMAa6lu8y1ZjkuM6D4mmg5mzLGdmyh
         hfpPbMwt7Tte9bgHuGKpfBoV+MjzUtMP6+Pff+bDKR/ENhqaKcF8V5FYt+ug/J4h8SzN
         II3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnj0tCihcl2SV/I9apNJJZbTMeovG7N5QQ8gEeTTe7Y6UZXSWTUChQrPrYdXVvSGxyf3FJZgnq0/jQvP6zLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxUoaVeLexiuRHuIfBMXRGonUQblmhUlrl3e35hIWfA8BtkMP
	eo2LVt/eLNfolFWL8INPsO7bMg282qmfSx2E8Zt7DMAubNGK5dURrEoK
X-Gm-Gg: AZuq6aKVtjFNbV8npnDD6nF2oTmNdcmg0hUx3xT3BBh8r3IcMH8Gr2gxcA+YR7MiUPc
	dbQt/nsef3aRv9BVlGbEGQ9bV4Q8xVGbxEFpZtzv6En7ntaiye4xE6F+n8tS9CaauK1UcATUxds
	FYUgLYYb6e8g1xrhFEHNeiawn27KvBEAI1uhEbSMFM7G9w9J8vM7DJmiUDkNqyaE6A4UzN5+ag3
	oRZWFmnq/S9vyT7UTsEcFSp5dfsMiIyRbyI0+NRK6unRP/F4KUkPAvV0dRLFrhM8eAo9dogDXrM
	ZvpaLkAWq0Ei96f4nX10VLXEXQslXGD3mVlWhoAyMQV8BA63j/mQtH+k/NoiREJIJVw12uButAG
	mRyf2EXFp9UTYG4afsFU79kpN3us50Ah/Q1I8rxgg4GCMoMepTfajPogA2UvtU08j18vMnIDXxm
	ZPbrBgEODckVHx7z8BOTftMd2P4avHFevp7e7r
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr114047525ad.37.1771255572099;
        Mon, 16 Feb 2026 07:26:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1ace5e1asm72375535ad.92.2026.02.16.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 07:26:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Feb 2026 07:26:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, joel@jms.id.au,
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] watchdog: npcm: Add reset status support
Message-ID: <21707662-d2b3-4742-9b0a-c964225e6ea4@roeck-us.net>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-3-tmaimon77@gmail.com>
 <e946baf7-4c3e-42a6-9cd2-a4b917ce09bf@roeck-us.net>
 <CAP6Zq1gGVB+hk+=xSRyPgddq07F_B+oE-dc246JRW2_waoe_bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP6Zq1gGVB+hk+=xSRyPgddq07F_B+oE-dc246JRW2_waoe_bg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4948-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,kernel.org,google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA48A1458D6
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:30:46PM +0200, Tomer Maimon wrote:
> Hi Guenter,
> 
> Thanks for your review.
> 
> From your comments and from Krzysztof’s earlier feedback, I understand that
> I cannot use Device Tree properties to describe software behavior, and DT
> should only describe hardware.
> 
> Given that, I am trying to understand what would be the correct upstream
> way to expose the different reset causes that the GCR reports. The watchdog
> framework provides only a few standardized bootstatus flags, and I would
> like to check whether it is acceptable to map the different reset causes
> into these existing flags.
> 
> For example, conceptually:
> 
>    - WDIOF_CARDRESET → power‑on reset
>    - WDIOF_OVERHEAT → core reset
>    - WDIOF_FANFAULT → watchdog reset
>    - WDIOF_EXTERN1 → SW0 reset
>    - WDIOF_EXTERN2 → SW1 reset
>    - WDIOF_POWERUNDER → SW2 reset
>    - WDIOF_POWEROVER → SW3 reset
> 
> Is such a mapping acceptable?
> 

Ok with me as long as it is well documented (i.e., in
Documentation/watchdog/npcm_wdt.rst or similar).

Guenter

