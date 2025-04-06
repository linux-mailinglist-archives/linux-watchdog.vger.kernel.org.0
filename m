Return-Path: <linux-watchdog+bounces-3213-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE26FA7D0A4
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 23:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AA3B16FDCE
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 21:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33D019CD13;
	Sun,  6 Apr 2025 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDA0TBCT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE4AB672;
	Sun,  6 Apr 2025 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743974236; cv=none; b=H1153p+FnaKwfmnOrUj4xDCmiy2QzS5EU++sOaiaH8NCLLbXhqD5z5jJYAHzWsAdnuRnlE6fYIuxokgH3BoNw7HwLCwtyC5SlnDkQ5Zsv1ZRalMtabqrdHYYolqhRKOxCE/qvqwMIK1dsFlZJpCCh4AeKJUsgvk+WJ6XapBmsWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743974236; c=relaxed/simple;
	bh=DBsF9AbG6GPYNy7eBjY+aRHqqQA4tE/7RNs4ZvF+iwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uj5AVdu/HstjzZ1MVfJUah34B4rYUYQlW44i/GOZEntxjUcuryvS7g5fUuCXQm808sbSvvxR5CwiYsS9BjvCcgAAVHSVv/9g5ZOSgKREkRhsjflUSENSlBPuIQQclqF2rJ/QJbYruQt/J0CznYHgcvgYkbDupNTEbDdf1vVP1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDA0TBCT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-226185948ffso35946575ad.0;
        Sun, 06 Apr 2025 14:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743974231; x=1744579031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+Dh3Q+/ESCOTgc833hn/a+Fb6lN+IAypXdcE5FvZtyA=;
        b=EDA0TBCT4Uw3E304ZNRIWOrsMXL3Dj5/V9gipq0byi02Lo/HJLQPdc66JW7E0EkBhr
         RO0+r5mnzuq7si4TuV0WUUNWJIZPZBYQNsmJP+VIHIarRuE4W8wy4dx3yjJ4IUcO/JZw
         4BeFPO4VKfbJkErm/0JgOSHxR7rLcABb5WPcPXvNLi9KS1CaPQAgpyebFRmW29v4RIyx
         +2LFXgbQD49U0VWWsWcSC8uC52QWX581IHWlT7slYQicCpDATtKOwbOKgo3zBzhPo+nV
         Zqk5ANuhGtEtuJmCJQeNFS9M7CpVM8UiyaLKiPqruVWFDlTfWlLKAJ/Hxj/ilbgRb6L2
         WeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743974231; x=1744579031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Dh3Q+/ESCOTgc833hn/a+Fb6lN+IAypXdcE5FvZtyA=;
        b=wy7tNRviSG30kSh+X0+gqJfeZHG13ZfSzZ01lPRGcZtSaQIHwP+KAltfDJLRxqNAK5
         R+thI6ujJUMs7p5zzbjdVWgqU8GOGSm4CDdftp09mKU9rmhu54KXqIMaCaEVv6kIl1Q/
         /oW1SRIT4JY2/QX/kC7BAx0ukpxjNMO+kLkn/MFwExY3QInmSuOJUqkyO8swWOrBqGC6
         wz8fPFwSbSTHAIWJPKvXfPOMG6Kjw/KIjFdYLFGPT8/ejMz22P/2F5yhKnkGN2fU+fXa
         OC3PcUUdXHk8TxRA1rOPb2N63/eXsexU7yvXb0mqtla3CSuD2Tw4UI0q5hHhv/cp7I0H
         F8QA==
X-Forwarded-Encrypted: i=1; AJvYcCVkF1bPuR4iPHLVy/YcOxUklqlID5U4CPAvj7Elj5V+KFZ2ztEvcp5yV5A3d7jEQaZPBkSVyq6yHv9IsZcVhr8=@vger.kernel.org, AJvYcCW87phZQ1+JeNM8zygF/THBeqqEVVZYmpzAFkH4FTGIELpJVQG4hCABUNwX78mJjS9D4idcLSf03NfrExU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2EYHea/ZAV+y2esZCVKmPBjHHSRiU4uqjd7sJ+4mhL/YD1Tnk
	hLLhgaUZTnmnWF8QnVQpzQbr6v3yJBtflh9YZKEacGvUjWTyECdo
X-Gm-Gg: ASbGnctPneHtxx0GoEZ8+btyJF96aZ5XqzWNHSwGdx8QoszLydggqwSayPcRU+3/BKx
	hkD2YvWqnVuO05JeUaMZLs2Zzv7WNTZuflDT15WW4DEfEgjqiYLMMDC3duIOSEFyfp8hTQzGxzG
	CjeIEjp0iimqgFjH2Ou+V4LXGT1SUc+qOYMsPlG0nVNMWzBO0NXcPpt9SUbX1ZkslRHq652+vHR
	LYuH7Z39xRUCfasxTqG61G8G07iAypPMUlmDmij5UPGI/tDhv1CF5bNU3GyunLoqYxojt7o87yX
	D9yIjse2MYHHV5I5UjIoM0asAuaCOgXWtfCEeYN5ZWUdqQfZ+94atqynbE4swr/B/1U4Duv+TsX
	SDI7DvuoEbw6/HQL7QA==
X-Google-Smtp-Source: AGHT+IFZhV9L9NQnjbxHqzuQWHloSa51wng9XDm1os9z7UwsaUvtPeYzq/GeVYYATAq42YOjNg2ktw==
X-Received: by 2002:a17:902:d586:b0:224:2524:3047 with SMTP id d9443c01a7336-22a9553aae5mr91276255ad.26.1743974231454;
        Sun, 06 Apr 2025 14:17:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e7f5sm67292515ad.206.2025.04.06.14.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 14:17:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
Date: Sun, 6 Apr 2025 14:17:09 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device
 unbind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/25 13:35, Krzysztof Kozlowski wrote:
> Device can be unbound or probe can fail, so driver must also release
> memory for the wakeup source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


