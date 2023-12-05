Return-Path: <linux-watchdog+bounces-140-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F9180579F
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 15:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 044A02825BC
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 14:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025D4524BE;
	Tue,  5 Dec 2023 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+sOAuwt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D303CA
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Dec 2023 06:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701787380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYD0X3rZjwpNcX0tntI2wIO2stB+eIozlFrReCKadJ0=;
	b=V+sOAuwtNoEDFB+XYaMssgPofSHq+aSbdOrdXGPhjvbdO0d3HLq3rnC2p0n/mU5kavGGnY
	hSAE8RCJR+6vJqh9l/LCbuDIZPuruzQgx/NYbLmelBdEBa4tbb3bw89UpPqy5KC9Kt5w+A
	gP2GGC5mc4f9jA9MxbLJkHuShbfrrNY=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-U6dYxpQvPWidVJ14P2BW4g-1; Tue, 05 Dec 2023 09:42:58 -0500
X-MC-Unique: U6dYxpQvPWidVJ14P2BW4g-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-587abe0ab5cso7989490eaf.3
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Dec 2023 06:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787378; x=1702392178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYD0X3rZjwpNcX0tntI2wIO2stB+eIozlFrReCKadJ0=;
        b=N3uH+CUk2KcYM46haYhsexDU8Xg+XCck+I6aed/W7ZF1zkx7pxfnSD+Bk3m39E4dSu
         f5rFZFFQxFLrhd/vRzZljw8MiI3dXEWUOJRoFPFt8vO3JzMzmWgXG9wLCxJNpELZr08k
         a1mxYkM0sTSSLL1TODPzh8BBY3XJ5l0JUYzkSkAcHr6GiThrVkACDB1AfzhNFTU0RQCy
         vhcvDH7DmzaEcSEgKGzYbpAcQWf2QDQ2s6exaMFmka6xw4x2CC7bAJx3S8z+4ADSGOp2
         kWBeg61kEyPmPKMn+RXKzmF+NiyBMTDc+TTWA74MBdXzrPM/cqwNlwv9Mqs0eFlv4ol9
         yTEg==
X-Gm-Message-State: AOJu0YzyJwzdWoglGa/7QAgDR+Xt3rrLjySRzvjNVxX02NG8u7AMU7jv
	GzFnvmynSReWP+d85Gcerg6L/MF0SoQn7vWzDmtkcDWR8CbuNCgh11dYFAKhO+f09e/PpbCaaiC
	UP77wgC05ayZnhA6v+jXVioKRg4Q=
X-Received: by 2002:a05:6820:1623:b0:58d:9e35:aa01 with SMTP id bb35-20020a056820162300b0058d9e35aa01mr5371108oob.3.1701787377919;
        Tue, 05 Dec 2023 06:42:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBHHg6NoZv9mMdXT1Vy8JkTAhVr4Tf9B3BabZKgCRGd05NVkUVu36IPh2i2Hf6nWLHeTXNSw==
X-Received: by 2002:a05:6820:1623:b0:58d:9e35:aa01 with SMTP id bb35-20020a056820162300b0058d9e35aa01mr5371101oob.3.1701787377598;
        Tue, 05 Dec 2023 06:42:57 -0800 (PST)
Received: from [10.16.200.42] (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r66-20020a4a4e45000000b0058d8325fc60sm2377796ooa.0.2023.12.05.06.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 06:42:57 -0800 (PST)
Message-ID: <7dd6f44c-0f4b-4127-83fc-a8cf7e6314c1@redhat.com>
Date: Tue, 5 Dec 2023 09:42:55 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Provide a better stop error message
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 David Arcari <darcari@redhat.com>, linux-watchdog@vger.kernel.org
References: <20231205140926.397956-1-prarit@redhat.com>
 <856c571a-41be-4e5e-9bde-72a192b14801@roeck-us.net>
From: Prarit Bhargava <prarit@redhat.com>
In-Reply-To: <856c571a-41be-4e5e-9bde-72a192b14801@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 09:32, Guenter Roeck wrote:
> On 12/5/23 06:09, Prarit Bhargava wrote:
>> Provide a better stop error message for the case where the watchdog does
>> not stop.
>>
> 
> Please, no such patches. We are busy enough as is, and we don't need
> people to change log messages they don't like.
> 

It is impossible to tell what actually happened without the additional 
information (specifically the current thread).  That's not a "don't 
like" as much as it is a "provide better debug output".

P.

> Guenter
> 


