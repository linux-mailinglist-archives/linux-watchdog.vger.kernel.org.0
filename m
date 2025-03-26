Return-Path: <linux-watchdog+bounces-3150-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFEA717CB
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 14:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6976B16F3FB
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822DB1EEA59;
	Wed, 26 Mar 2025 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+E1SlT0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990F1E1DEE;
	Wed, 26 Mar 2025 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742997112; cv=none; b=TgRkXBeoDx4trd3brA+gfyfB7EA84Vm/G+U1nFYE0llCfCN/7XdWDm2jVChJ+3iW9j94p/jIAXHdr23LvTeIYUmzQ8hDXmw4QOKDQIHyPaeVYh+0Yv7MViVr6/cacuCuV7YGAy7U7cKI/6kdptxM2sI7abVPwBy6eH9W94RELuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742997112; c=relaxed/simple;
	bh=bu4asBRdC4RRtN/pxKXaQglE0bpqNeoDoUs4DfphN7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0J4zCjFOMRYBw4CdnfRFIaWdQHMZ75XLLNaNwqQJIYGw2WiTHx2eQHg2mInjAuUmY/srFQ+Lwjhjckys6gLDQNf1PxKWG5bEXpz7wy1V594l8Va/x5E6YHEf5jEBW7fyQqDyRtiwAyjludrriG9986wrsX1icNx2bW09s/ciKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+E1SlT0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso12544692a91.3;
        Wed, 26 Mar 2025 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742997110; x=1743601910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9tuBIy2YPh/BlHQ7L/iO7zJXGbz1NtAKWQ82ltFlAhE=;
        b=R+E1SlT0QYfq+YqYzjL/KuRqNeKMy+/3Kd7/jJaxGFJ3/p/utaRHLkOov2Y6nL97Of
         XbL2klp3SVhZt/fN2HdalS48XfUxRg1IKUocXSrytRf/AWsaRKNsFPdm68OgtOSksS4f
         mgLjTh9M86p16IaokPwTxJiRQMOG+ZLYr8phOcPEaX5Ba52BVSP//wKurORC7OaDNVFz
         eVN2jkdJ/kyvmuwKEuWAyXh9Hvn2PbU3P+z0UWMd9O2BtJr7tPidHSclYwz2AurLAPC/
         vtszUfZmddprU6e2QkmmEP8DHIz3bn25g3k4v7rHDylElYpaxTHw5IIyF8yby/TRa++G
         g9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997110; x=1743601910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tuBIy2YPh/BlHQ7L/iO7zJXGbz1NtAKWQ82ltFlAhE=;
        b=k83+2tcVCO5m7/fKIL4smWowSj5X9z1kMLPrY9PL9UsMwyf3pRaILIu5VXR9q4qGg9
         CKHCIlEl0QXom9pLmg5Zs+a7lmQaEENsPZXc2Jkb1fykQBUrn6bmCuVIoS5TtKcc2POJ
         LM9lqiitd/11Rov+rKHU//dJTugjbdNBeDG3+cWQJPLdnCebEYLWc9XoCyuA6+cKToM5
         Koh/rktRD28vvq6rTdjR54YTPhD9TejWlC1MI6eMz80XkHmbdgtGj3ssYNKF+9OmeuUQ
         gNz1Am3YEsIVJl1N6xQru6ibWYNCYB7/h6VkUvzSSTdxGD+lo8D2zz5keuaGWQ91gBbK
         xYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFoZFaoWZAfCRzz1aTh5PGWNqr+CnNsvlIkru0D+Zr2FHk2iTgolCca/cSyNaJ66GWYhDv+Yrh6mPwt0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfatqqQs4xuum28scDPpgU7Rj1NNxoqu2GNDk6ydbhKuFD14Vh
	oENeUaTOttQmQbJ5wpS1ilWkt0Zzt6O9aB3vQLTulvje8piXVi3A
X-Gm-Gg: ASbGncsAefe6WIWVUFAInOhlFo9NblGDbjZGe46PO3PF5AUDOdy6FCfcN7z2Kxrzz3I
	U9dALrpsDHUPMfKfR6ZYeujkXzItH1ULZ4cQYB+lBcgSrENNSGy+1dUgXg93naEnq72TCfvh306
	GYAN+4TATRpidiYOK/aPrYQvdNeGKb8nI0ocqyCibPLOb6SdRtFPrfDOMfLbn5nBJUKvdz5kDwz
	syiDUoYIc4NV36+VYQXG6IehYeoN4UoaTpA3I4/YmtLujOWCJmnX2b72YavM0Lj8YeztFRYA8hf
	Vd+egNz8jlfdfpJQBBgMrCl5/AxhLIwjMtwjyK22Y1xENsg38BqesXabOppUsCaCQmvC5+1hbp3
	8EYhVAMbJhEysvdblcA==
X-Google-Smtp-Source: AGHT+IHLAT8bnLxFyZ4f1pJCYEjvrPp97IZe5ztsiM2eVG0nC2xtfa5NOTvJHhxy9/x5WqnN4X3tWw==
X-Received: by 2002:a17:90b:2747:b0:301:1bce:c258 with SMTP id 98e67ed59e1d1-3030feeb4c6mr28799524a91.22.1742997109663;
        Wed, 26 Mar 2025 06:51:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dfd4fb5sm181652a91.7.2025.03.26.06.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:51:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9a9709cb-4b75-4c73-a232-4d85fe068b18@roeck-us.net>
Date: Wed, 26 Mar 2025 06:51:47 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] watchdog: da9052_wdt: do not disable wdt during
 probe
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
 <20250326-da9052-fixes-v3-3-a38a560fef0e@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250326-da9052-fixes-v3-3-a38a560fef0e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 01:29, Marcus Folkesson wrote:
> If the watchog is started by the bootloader, we do not want the watchdog
> to be disabled.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


