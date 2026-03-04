Return-Path: <linux-watchdog+bounces-5063-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMNwEoX2p2mtmwAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5063-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Mar 2026 10:08:21 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02A1FD3A0
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Mar 2026 10:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB2AC305503E
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Mar 2026 09:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A41639A074;
	Wed,  4 Mar 2026 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gss/iCg+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fk6sKKSC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B6396561
	for <linux-watchdog@vger.kernel.org>; Wed,  4 Mar 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615018; cv=none; b=TMQTD4n5LfjdGkXRWaoznb3lMYHJJFus/N0Ua53mvGm/YyZVWTqmC/PR1kS3bUGxy9NxSGSxDI4pJTw9WVlLQJZYPpyEJU3Il6xWBIwROtyhUD5SdXVcoCdz3miXqRIwipyQuv0yLs/Y9xVirA2AiJ2EFrlJr20+4yr55Djt2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615018; c=relaxed/simple;
	bh=7Yu8AGLKirVDPA2TPrB0ciJheoHEe4QHGDZcNV0GmnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJYINct0Cw5w5M6HQtXB6dP4MZ5B5EIEJuW1mvNI4GR2WSN7g/8s+cBUcwy/JvzXKzHcAgu5/oTV8cQydOyJoB+BQFHJlNbBkyyoXk5i5hMnh0YXpZG1qV6TI8RcsHW8V9wlKRfIz+zKxAwS9X6O5s+lfRfyC1ciQe8Cxl4/4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gss/iCg+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fk6sKKSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SOGG1421894
	for <linux-watchdog@vger.kernel.org>; Wed, 4 Mar 2026 09:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=; b=Gss/iCg+rWOjO0XI
	FXiPOngq3YEIyQmyihV0ROxspnZCr/RZST8qpwokUZCARGNd0v2MZcqSg0NdflPU
	KtgbPek6xlYE0v2Yqm5iaAUuATqBTQBVQcGuHLEXoOqixaaxVkwdoPeoL1goc/Qk
	EBCDU6QbtqYmbjnruimWpk05rlzR7HSFB9Kz0WyacIQWoK4xchg/NY4nekGS0qer
	foPIQrHahLgMVT4qZjtx4adFTd/8Hv/LtVOiAkTNUYFdPeEf2ZzDyLmRyhpGK10F
	6UkSbMAN/pYC7L8nfVWPOWzCsuTI0OcapeVVNpjjy2W+CYkkxvaMcy8E1OGIf942
	q7/Qmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u0s1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 04 Mar 2026 09:03:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so976779885a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 04 Mar 2026 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615015; x=1773219815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=fk6sKKSC8OVbBi4ybS2ceSPYkWIbY0vQa1fM1S5Ux3osGXyvC5F8N4VjOTmgiNGSmR
         fbCOGl9jeamreXEqtH7GRI0tpG3e3KT6C46k4RsDP7vARZi+xyEC66S9ktjcACYAk4T5
         ZQJgudAZD1nJMYTAxOniWoF/O3+F3xJqd7p1xyLf2DILf6U8FKH8PCIW7IQR6S7+pBoi
         paDeRVkomit8UrgROaiJSjEiFz5Z1qi353/xlJRUn/Exq5mZUKZYP/sL1wHWAQe+TWdG
         4ttTUNAMAEkQ1FVnvn620y9Qn7qQiP3bksQ5YI0cN1CVRzK2ew/ACAkRIZZBIdhqNr/Z
         BhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615015; x=1773219815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=B9kFiB+hP7q8m8xJlThq2mdbquF48XgXNA2ajYN753bt6nSqauXUpmdgxVOd2T53V/
         yo7NZX8dZ8z+aZVhX4oPe8anyvtiQy6X1t8xzNsLvv074HAELMInwLwq6tImiHvWjcJ0
         oIeBOlII265h1oxG1H5DvYr7LS2GXG2bYrHfBp/ZRSsYXvYTXiQxI4YA1fqlZNW+vOOt
         YhRQWlNCKbiEOQQr3Pt42ntq9bS0IjAcvHwdiUBtysV9EN1UAM9+v1xNmG4psUvm2TBP
         Z+tYvvLBpaiz4ynU9gttRp5oHxNZXqPOfNODdYEjgTcKTeREtihKBgb9H+14Zl4BBV3J
         QFKg==
X-Forwarded-Encrypted: i=1; AJvYcCWo6sm32VCH3Is4P6KNAa/iEVMYFtWNEG96UK7fJGFqmuF4w+I2zYFGZGWhvfs30+zzgBOfNvGud66ZmAOsJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3139Mo0Q1CFvq4FHfooXk5E1xKvBUb3/baw7YoyxyzDLNXjE
	SqepvbuPS6xU/jBXyFTtPvuC8i2BIIUFMpAGNqjNLycLnASPAu4UT9MEUJLIuOTNBSvW549AWMC
	JqcBt4qzU7wCBAsogKX4/cvKBwACHF7bKJwMhkL8G84jHv+mi2lCKhMonEq8fFbhdHAstrg==
X-Gm-Gg: ATEYQzyQwAWaF74nxm6F+X4CC+U/mRwfa8UlaEGF9l3ldv4MaRz/3k51E/CTe2iOR/k
	sJXrphyhyVln4RTzC4eK2awe/RGsTOQ3Cvjp0d+IaZ2w4c3T+28+W7Lcx/KYlG6u5lUfZi8wZu4
	FPCbYsszr69a1+RK6UuehlICslCc+x31i8GMWjwnQEbZxRwBvc28YdMHpdDjl0REhSpeNnk6nJj
	6yf/cNmll4GJkiYOhavQW8qzv+l3RIc5RyYmqsy1zfhi8wMZI4LgdFzuS/2JkveYzDHlm3tMlVp
	ndmpaEVezRpQZDFKP/XLbzbnKDxPK9wBIoFnMpv7L92UKfpgOcvM2hV1mV4arVGTfynQ2AI1roM
	r0rRMd1T+tgZxKIAOjjhjqkUsXEJAKHQhGO7Isyjgsh/FRkkWtstK
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160327185a.38.1772615015396;
        Wed, 04 Mar 2026 01:03:35 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160323385a.38.1772615014945;
        Wed, 04 Mar 2026 01:03:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:32 +0100
Subject: [PATCH 11/14] bus: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-11-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Yu8AGLKirVDPA2TPrB0ciJheoHEe4QHGDZcNV0GmnA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0GLkuzkdEz+C3tJvMp4AQ7C/WH2/5dCKx0
 BCzpx6BvgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 wwhCEACKXR8hW1IiOwR5KrvLRZgVvnxKgGPrC7L6xvxbiMUnVqeZDdh88R5a2U1Wr74IbeHLexp
 rrr50hvFMkPBnqhcQUtaCGZFk4/IKdKBTRif0xGrxJPtzugQE0tbQJj4lG73Ur+ncT9BoVtw4hp
 FsLDV54dVcPs4TKwLyNm+WCt8rpMjkD/eXQbVEZrw/xKLWNEZX2oRJo+dAPmsuAOr6paT48MdnN
 94Ek6kcqmo9P7VNgd7eTUikvn5ZQgYLs2gJyL3S5zXxaM7zGsEuE3o3qzVL4gUdOVrHxAMH3Vvr
 wo8TVnlirQfO+VngnItzgph3Ho4ATc95hFNirM8vjoCYiKifg9cziAaa82BZJmGJ43sIM3KpDEF
 +B6l+y/Kiz0jWsIyHHEqWi8ZrS34Y9hvIaP3eMMQ7OQpykM8x8ZbZRBd/sbK30im2Lx4fQ3qep1
 3DFSIMuHYg5sCKcgHz5zat9wm/aWg1LRmAohRvpwpF7dIsvpMDjrRDh5uQ9ryTHDRC9/3Oq20RI
 UXfzyjkKqs76K/4BmBISIcEVedtzYk62EOzPQ6hQLumZHoD8Q+OB1CeFKHjn7rOa2xQMVjeaqrS
 HsXOM8riL1ke+k9oIyQPPiwLnwdIqnDlE4yYfagLgPQTn81GkMlMuuQ9AVIKf2MaYI34UwFxZiK
 rwNRQQIFnuJE0Kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: iks0gdCWm2eEwiRwVTaw56PHm4_6jYNq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX7HE5+g9CH2rt
 T99sFAQFMNNVEffeEa1N+D5VfskspN4b1nO4xhFKlLHCclunRje4d8lHFNReClOUokQk2L9eI2q
 JLfIIIatFPhG9QHR2knNaF67sKBQAwjYmYRoYZlPxx7MZKN5BvZZMa6pU2u6XWG6/wdvqYF0L3+
 zUdB/CqkXxWo6KnCI7epJuUJI6vHOFrf1JWe0ZFd+R6U9DwV0rAHp3v2CN9cFCdvcDi9sRpZt0T
 KPzHVOQ5t5aA3cKME6qU3eNnpLcTNttymwFiecHmvEABV+/9wOEaXpRxBuE5id6Yo91ceuEFIyB
 76pNueSfZU4E5MVLM+IvSTiy2ESfdgJsRMhLrz3d37zzvAgepII3x0n2fP+W2az/CHtN1bN4Fn/
 jc2cV7Kp6oz2nyjPIEH0iUd4Qrputm2Tu/8yF1EJG4RiXTwFF0FWed47WndwTd+K7i+qY2n0YL6
 TEINaMsEMEDPXmDFiCw==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a7f568 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=myaI65ZsvjZLdZNFwr0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iks0gdCWm2eEwiRwVTaw56PHm4_6jYNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: 4B02A1FD3A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5063-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 2a1b46f07080b3533a9787254aec2e67cbe98310..c7dca0b5fb857a263e1ee730ede6002e88c418e6 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -236,7 +236,7 @@ config TI_SYSC
 config TS_NBUS
 	tristate "Technologic Systems NBUS Driver"
 	depends on SOC_IMX28
-	depends on OF_GPIO && PWM
+	depends on PWM
 	help
 	  Driver for the Technologic Systems NBUS which is used to interface
 	  with the peripherals in the FPGA of the TS-4600 SoM.

-- 
2.47.3


