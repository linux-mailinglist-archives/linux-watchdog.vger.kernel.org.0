Return-Path: <linux-watchdog+bounces-1653-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB61966EAF
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Aug 2024 03:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC5D284788
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Aug 2024 01:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298F41B7FD;
	Sat, 31 Aug 2024 01:56:45 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C018C31
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Aug 2024 01:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725069405; cv=none; b=tGwK5i/W2HrIyKr/kJQ3l9EtKz7bKly5mkfrDFWS2I6+oFrj6tN8J3VrTXO1h/+S1bRtcYb0qRrwRlUEVkrRxcC2K/g2cus9yXS32lru6GIJ90Z4MWLqKrDCiDmJYvLMXMJnBAGUrI+JP74wmAXlRMmIeTVGWt4qtwr9kbXpOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725069405; c=relaxed/simple;
	bh=XJC+97M2HeaPqrP3hhicMsgmRz6c/iAAnG7MaYEfbxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ira04zzKO3s5GxSp8DOtuENXvOFVIdC2xD63+v0+GDV3hk6XWRnWLFhpGBHqQNpAIaFeJRlU/xShVh2/6Et4uIH9JN2YGbWG1qfy809BHFhrkwk1Q5UjicLgGkvjHAKcSHhapO12y9uCXGZZZIiUHtzTwteS0sAMH6iqW8Hg8bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WwdPT3dqbzpTsd;
	Sat, 31 Aug 2024 09:54:53 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 8602A180100;
	Sat, 31 Aug 2024 09:56:39 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 09:56:39 +0800
Message-ID: <e6b6a24f-4677-4ca6-8583-12928ca81365@huawei.com>
Date: Sat, 31 Aug 2024 09:56:39 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] watchdog: cpwd: replace simple_strtoul to kstrtoul
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
CC: <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>
References: <20240830080220.3545142-1-lihongbo22@huawei.com>
 <b1ce8836-8ade-4ea8-98d0-2e893aaedcab@roeck-us.net>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <b1ce8836-8ade-4ea8-98d0-2e893aaedcab@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/8/31 4:09, Guenter Roeck wrote:
> On Fri, Aug 30, 2024 at 04:02:20PM +0800, Hongbo Li wrote:
>> The function simple_strtoul performs no error checking
>> in scenarios where the input value overflows the intended
>> output variable.
>>
>> We can replace the use of the simple_strtoul with the safer
>> alternatives kstrtoul. For fail case, we also print the extra
>> message.
>>
> 
> I really don't see value in this patch, sorry. If the driver is still
> in use somewhere, it would be much more valuable to convert it to use
> the watchdog subsystem API, which would also address the above.
> 
> In general people should refrain from "improving" old watchdog drivers
> unless they are also converted to use the watchdog subsystem API,
> or unless a real bug is fixed.

Sorry, I haven't noticed this.

Thanks,
Hongbo

> 
> Guenter

