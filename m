Return-Path: <linux-watchdog+bounces-5017-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOrIBAxLomk61gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5017-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:55:24 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7200C1BFD01
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED86C3033526
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236922FD1B5;
	Sat, 28 Feb 2026 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4LRhHVz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AF2F5487
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243721; cv=none; b=rYSIzLl1NzhBuLbRevTEmqQsfjYAgA34CbzepDgDO9HTNrQ+1lts35i28A0zk5wcmDh6zzr5ND82uOQ0TVXl+kMkrUX6K1APxnWDHTpC6WtkF9iPOk6ByPtwG/ij2wxfZ6UfKKU3cjQTLMZBBi0CovpbOdUc2Xqy7vMxcETg4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243721; c=relaxed/simple;
	bh=wSXKBv1s9N7rM7tMp/dbyCKz7EHhkOlMiIvXCLsWZyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji/9ZwZ7vRuv2eyZvEsaVbxdl0v/8ObsKv2PBQVaY4UVkzkXNkJVZ3FMth+BLH3qxq78/VcrbUlmpCnsgXZdI9oexbcv0gVk2g33Duxh6NQUfBOwHf+uLR81vEXIhutySlRxAF2VLFE0ev6g/tJ+FNGk9nRp3m1mdp9/7xwjRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4LRhHVz; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdca815fdfso1408050eec.1
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 17:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243719; x=1772848519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fI74CQjZrJmGul0yaBzfJGuaMOgAVh92XkiFRIDxOH4=;
        b=d4LRhHVzF0lW7LcZ4Im7ZDlCxEd5LMwfyXJyfFr/eTCdoZ9IQDORcplINwQDlp05Wt
         JsKGeXJteB+fGWRjsP9I3xD4b/34WYHDzgL0Ri3NpILEvu994+wvyMu2dEHrlStXXcS5
         Q1BJN7EaOOTBqh6/eoiRUiIdVuHVG+zl7mLvsVkqtm9oLn7UyCFJ5q5U3rCBKGWh6uFQ
         +WfOde2dg0w0pP2iqnddK0y8nLbJeJn8xIxwXB9zgx33j78IZni4MgEcDTyS5/7jeNc6
         kd6XV8I0BGyrEkit28n2Sz808P8TgGIUbh7oO4gMR0FscRpOuLnR9dqGHuuuxlPkKeYc
         47Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243719; x=1772848519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI74CQjZrJmGul0yaBzfJGuaMOgAVh92XkiFRIDxOH4=;
        b=Lxq5CjKI/NHYXj6wA8pf/iYOMgJZ0NX0MA7e+v/67bIx9ABw0wP/QbGMzCTWEahX51
         weoqIwJdnWzl1tz7KokGVcfTWdO1X5rn8rhOnCmAkIKLBAEERbONydUc6DqthUrG0cL5
         woJcaqFI3hBrEPzOwFQZHFRmgsR3rBnX4Ah6RXbGKkQuY5r0OWnMELVkJ4WOd/vZPGuk
         SpcuyaP1Gy16Sh36pasd4BfyjxH5sOnyVHKy8EjsCC5OxuBLA96BIAz2A18xxAjpHVRr
         V3ptxKz6TXlhRbZyMxHKcYh+aUb2ZYrHgR/OcVHwaJbWQ89acoaoDMw0YBdP5qYTQsbR
         cddw==
X-Forwarded-Encrypted: i=1; AJvYcCXcENC1gVEcB1NWhvR+Xhqxd7F4fQys3Qf0toBROCxM+QRE6Qdz7BZ5R5nuXo6BGfvlGC1N+dTgIfYGrV020w==@vger.kernel.org
X-Gm-Message-State: AOJu0YztZWTBIWxCt9ccEdoBGjNTQQH7/W/y/u0UICHrpV+rYbC0RzuD
	X8a6de0Yt0NhfzjAgE+kPPUBRqX4KaFSrVB3lwvz5qYm9n1tHtLqYHvK
X-Gm-Gg: ATEYQzwo4cq3AolFrBFVf9oBJlegHXJ2UlMoTxMtBUIiASs7zWkbkQLW+UojZrGQwS9
	OR29iQTSJXQkitO/1qqvx2sqmqdpN2jb17Pl2n3EA+ogkpgEUlsG5XhVLUvVp0F3zdLp3Z4UTmE
	0KEqmNd7j5ZxJICde4ESM+CQP2mT/pZi1RpTPo8h/LOSwZ7fmzk9vWrh+Dee9KQ1Li3BsJ6AlfD
	XliMnAsfDRkIiGAi+im/m5e2d0klYSvpx0PZeCuFIlex74yEkuqKbqojsBZhFKzKDHCsCs4OeAr
	pho1GhtohxveY29/YSR2L08aH6vI8zUSF4vY2sYcbb0BHXl+hIaf25QWct0fvjsytTCgoLGsqbb
	VJgd9dhVHadUGcKcTXCBA+QbGerXYPPgmmRhpIBq9Pr0cNotZZHlak3rbcar5F7dmX74GC31PoT
	539Ypz2qPslI9gDCSXEAmJUX/jRq5DTlZtRGokueAI0xSZbn0+t1STiFzasWYQS8x/EJ3cIkQe
X-Received: by 2002:a05:693c:3618:b0:2ba:7875:10c9 with SMTP id 5a478bee46e88-2bde1f9c38emr2009598eec.26.1772243719022;
        Fri, 27 Feb 2026 17:55:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bcdf35sm4871072eec.7.2026.02.27.17.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 17:55:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d5f50b7a-a71c-42fa-b5e6-ff8ef602651f@roeck-us.net>
Date: Fri, 27 Feb 2026 17:55:17 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] docs: watchdog-kernel-api: general cleanups
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-5-rdunlap@infradead.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260228010402.2389343-5-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-5017-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid,roeck-us.net:email,infradead.org:email]
X-Rspamd-Queue-Id: 7200C1BFD01
X-Rspamd-Action: no action

On 2/27/26 17:04, Randy Dunlap wrote:
> Fix grammar and punctuation.
> Add a missing struct member (pm_nb) and its description.
> Add a subheading for Helper Functions between the struct descriptions
> and just pure helper functions.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


