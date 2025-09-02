Return-Path: <linux-watchdog+bounces-4146-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9DB40A5E
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 18:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3051885D47
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 16:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B702283689;
	Tue,  2 Sep 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLc/MKCb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3F156F5E
	for <linux-watchdog@vger.kernel.org>; Tue,  2 Sep 2025 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829797; cv=none; b=NlgUaPNK0W2Q8f/YOyvbT/MtaVqW6rlh96rgo+a0GbvsybAvRSV8MkVennrvyK1R/dk98MO68EufN+WTfUuzuleQVzuZl2sACVz7SY03zh0c0WjS5Fyp+jkTLVcrwS0QI30f5Xv46SlS3gbhTKEhVjq2Q3aYtUqTW2LK/d5VKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829797; c=relaxed/simple;
	bh=s1AAMoG4dmq+IsvcZxHwaRdz0SQy006AViAVCksHxns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ek0LsU3dnvi2RWvVkrcfmr1OEKkdZqdScxKZJgLJzb2qsWGUwlP52YV+LAnALHmEj+5Imf+b1KoZ492SZexkGF40SaCDoONUEgUzZJVVDLKVGOR0gUphCI/3nQY7L9zSqwQl4Adq78lPSmyMape3zbe8tr6ruw+SDZqGGqihttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLc/MKCb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7722c8d2694so3499569b3a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Sep 2025 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829795; x=1757434595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xNagQZ9YvDTqPfuIIhqcUD6D4kJqM43tUSdwIEdMLqM=;
        b=dLc/MKCbV6qiNAr60dVhuy28iEy+viNSqLTnCziRCeLM8BK40S1O5aeV42aunZzqoc
         Rjp743guiK7keCjTIdUTSwvl5ocIYGq9tgW7i9l8ZHvN0U4ofBTAnOOHOq9q5rzwK+vR
         nFlDhjyLizQyxlgijFcbLOC4gC7LyBWVEptwNMrsZUwn9+Q0/sgaD4+0hFJC32fwV1nM
         tvWbmDxarvfuPg1BiXjOZgDU3XOqL5FGosPIuboOfsSVmOP7LuloIB+f3wB/4M/JTl+0
         ciaam7iz5ja3L0EIYJ0CvKN1z4a+M9SXieGewGGvhRsMpDp/xwVsRNsltmSdN1ug4t5p
         UlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829795; x=1757434595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNagQZ9YvDTqPfuIIhqcUD6D4kJqM43tUSdwIEdMLqM=;
        b=AdF9qVTq7Mfrs/1YmUtfTXYQ6kFZuW70aD3nLfrcS/KLZCaA3t/qbc1hC4xSMZ1o/J
         MjCeBjEyA9Kq7HWaLRDcMrcKRKBWeselIoL/fzHb9jkMotrqKcBXr/C55RzUI4fxF5hF
         wOabhCsRxdE8v8SJMlVK01wU8sQeXEhzRkfbzVPB2ZDTDD3nNAsGMk+3jKjjXJ2iRKYL
         MBKIpKze+XZeU80u3BvIbBdf0KAbJIlDSRheZdkS2BQTSTjnndZcAJY3JN+2Kkt+zSjs
         +JwcNDQ8zywncVGiH304/dGbCWdk+fOxTtG+rhSCIrsrnZBRJ7KSL+VcMmDW9KBbMSB5
         mxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGsoqSk+ffaAnn25cKuFg3XMgw3XO84M4x7fW3KDwlf3Z9RioWjN1bMuI9d1nw1Pii+4TAb4JTPRKQnVEtUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/DabwYoljvViksw3r50oc781osYym0oTxXZ/86EGyoraFJAT
	HoXyO4QuXnGjCal5JOC2gHU3d+fSGgPx9/g1mayaNl/gF1Hsb47mbx8UFHu9NA==
X-Gm-Gg: ASbGncuwdBmuuk8naf2OocLQgMouRXYG5B5jQ/VGgK3wfrWi41iOJrVbiIRtcw3KZe9
	TFpA1V/TNWHq6LAcvXGmZPZ6sYvQe6UiqwaYd4rHY4Dh1FreMFCaaqL2wCVQ5Xi6/CFV8apD7Qa
	OoHALrc+7nKTbjoUNAmhCwLZTL+EdEL3wtXV+MRicm13bX+kqB794glGiiT87jiZAqaFXD1nPWG
	V5aVpGAQG9GmBKq/Mq/fcPTukhMAoAzaw5iAqdW05NtWE+Xcz0qo1NmAsNzBcByb7PWwR8mkN+/
	GRBVTLvfCnZxoFKO1FmlimQGXIelXiVmPXkQzQsywqIU2QGzRoQ+gOBF2UkfNSVJZ3QCP9+QGKc
	kc0YYoVXy6nplFxiBHovXrXa6KMVGthoP90FMocCzY9saJzzCfVW7rkgieeXg3RwfjypEHys=
X-Google-Smtp-Source: AGHT+IEBnj1W02Ko8bgnUM6k2a++2VpueaWLWexujhQM/EQ0tJBvRWBYJ4jHhsy2FpmLU502ogs4mg==
X-Received: by 2002:a05:6a20:5493:b0:243:78a:82bd with SMTP id adf61e73a8af0-243d6f888e7mr17327587637.55.1756829794744;
        Tue, 02 Sep 2025 09:16:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006ef70sm12420412a12.7.2025.09.02.09.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:16:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <36744c8d-6b58-46e6-b009-9d9b9369c560@roeck-us.net>
Date: Tue, 2 Sep 2025 09:16:33 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] watchdog: rzg2l_wdt: don't print superfluous errors
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
 <20250813190507.3408-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250813190507.3408-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 12:05, Wolfram Sang wrote:
> The watchdog core will handle error messages already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


