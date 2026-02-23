Return-Path: <linux-watchdog+bounces-4971-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE/uKptunGmcGAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4971-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 16:13:31 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D66517893B
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 16:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAA2D300A63C
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 15:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD3536074B;
	Mon, 23 Feb 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTPVZefn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD04A32
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Feb 2026 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859393; cv=none; b=enxYiP9Gju8AjTnbtdQg4m3bSBVQlDNAyKZv6k1oGbGNHQnBKD//C6WksH2BRbIfzLsi3ceD48G4BPMHZqCBjD3hqSgP5ezAMdwfPb11Pid+px8o2Y2MqMZt8biMhlv/A1V3bZXXYfZPH+X9sJn+om1KgEhWOMOGhOxVYuIqCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859393; c=relaxed/simple;
	bh=PdXNirrhrGzvskIWnoARIqLHN2ASq5MjCY2ClYaa+zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NktXWEm5gxdvJtKzha1XZyAAuynZfcfLaqOjnfepOuBpVEu29TZrH8z8SW4B+pi/M88gg10X/2UYrmgrPJ1vGTIrkC+hYt41x4z1sdkh8gL5A3xm/KVj8bRbcABny03sMm4aGQyLcqYU94fTxcXw1tgyY3I8m4qsimE/O20D+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTPVZefn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8230c33f477so1879495b3a.2
        for <linux-watchdog@vger.kernel.org>; Mon, 23 Feb 2026 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771859392; x=1772464192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IFPS7lJhuN4r3Jnm4VFTzNOt4dETUD/SPcPN5c9c4ek=;
        b=hTPVZefnKoP9PFjv+lCV49gQMt4uRCwzeHOkYcd4DHCDX8/R+VO6bLfCLagi9FVgnq
         nNwVAqpEmOeImszWkXfwS5v0dSP1R998iUg5IxgWN44jCBSTBEyY8is+Bogc3z/EtD7V
         +5td+KM8NBLB6pf5lrcL6cKNw/VsZ3l3SjP6KJQDrz213P8+6xH7CZj3E3kTta+X/ubH
         ZaFqpoSQqX+44ILccWrMEyRWk2uLHaxNDtmqw9SUMnHbN2ttLW9/P/Hzk558Fhbz2Fl9
         2+3uXzlGzAd/vaM131qMsekSocXfIB/DH+0kgXj5T4Yrsl4nPnTL8P/VHDg4xduhA8iv
         rKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859392; x=1772464192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFPS7lJhuN4r3Jnm4VFTzNOt4dETUD/SPcPN5c9c4ek=;
        b=bZr1ucefzHhWrAp01kDuv7Mo0kk3O4oR+WEEXPSybL69HzafDhOrJe1qRXVeEpJMdL
         6GAV1ZrsXL31qIPkbbbdEQNNeO5nzXj0PbMtFShQI08jYHoyFz3qjlS3jd0PY6UmATxL
         kdKIn009IdeoTFjelCovAgsz6b69Jd/7HJEJJB4Z2uFDutuA7Aq7QcvD6sn/to/bW/u+
         sSxASfxr7OLJ2vs9x3DObv/9kpjZdpBsgU0rhGhUQnFwcEvYFUFeNBj56JSvJWWCn/VT
         YURo+1U+nDax0GvDDvdRRlOWmkiQ682cuMRy32Yo/zCTyy+0fDMRNZJBfZPupH6sCUXF
         7XAQ==
X-Gm-Message-State: AOJu0YyCAO6o0V9LPOZCRPUbGlg7RYq1XsBGBVwIiaD14siZOnIlxJ5D
	WBsJ7iiFP2e7elhdccw55iseO8w9OgVBxgLlTV6iRpSOETSFXioBPLLV
X-Gm-Gg: AZuq6aKzwK0yL4/G60jkJbxKypOXUd19g8KhibfY2nRCTJmOqk8iWABB8THHEFqcfD0
	9bt67sYFFigyZzJBqOi71MWATeyWTdYyLLa0O0+eZsKq811A6+9Os+RuEmgZQNZKrjm/1JvlUZA
	e0mvCx5a4RJH9nbbesRe6wJCZu6IaJpoz/56zdOhh3O2AwS4la9J8E49oDIa8cCcZwnjuZGrMCD
	GXiytusGI8o1kmrtWlFxJxG54qK8P7TZb5bEgq23a+a3W+kei80bAoNsTzrJpBt2fy3v+LIdsdB
	95g0bsrxnfz7twXzLheTsJLF4yn6HKc02rBnX8VzcMv0qwrpTRMraRqNDr29U2GIFvZFUjUjeps
	45mCKE8J5Jx3DWKqZcXSkAvOnyQOTEfDZrrzhQcOC4jnJ58isDjSIvUyoskVZD6hoFQ1ZNA55xP
	lMYW2LiDDhYm+DgQf3GC7qZn8qzVyGua4Pun7LY16SmAeMxHdhcHOpTTK7UL2iW4CxDxL8lUa0
X-Received: by 2002:a05:6a00:21c3:b0:81f:852b:a936 with SMTP id d2e1a72fcca58-826da9039b1mr8790827b3a.15.1771859391555;
        Mon, 23 Feb 2026 07:09:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd68c0b8sm8597569b3a.17.2026.02.23.07.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 07:09:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f25c295f-e352-4ae6-bebd-65a1ab8bc78e@roeck-us.net>
Date: Mon, 23 Feb 2026 07:09:48 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sprd_wdt: Remove redundant sprd_wdt_disable()
 on register failure
To: Felix Gu <ustc.gu@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260223-sprd_wdt-v1-1-2e71f9a76ecb@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260223-sprd_wdt-v1-1-2e71f9a76ecb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4971-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com,linux-watchdog.org,linux.alibaba.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: 0D66517893B
X-Rspamd-Action: no action

On 2/23/26 03:59, Felix Gu wrote:
> The driver uses devm_add_action_or_reset() to register sprd_wdt_disable()
> as a managed cleanup action.
> 
> When devm_watchdog_register_device() fails, the devm core will invoke
> the cleanup action automatically.
> 
> The explicit sprd_wdt_disable() call in the error path is therefore
> redundant and results in adouble cleanup.
> 
> Fixes: 78d9bfad2e89 ("watchdog: sprd_wdt: Convert to use device managed functions and other improvements")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


