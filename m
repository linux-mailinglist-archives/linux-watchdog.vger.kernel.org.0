Return-Path: <linux-watchdog+bounces-5045-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGbXFWlwpml2PwAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5045-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 06:23:53 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 438301E9355
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 06:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D47173010837
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 05:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02D82F6900;
	Tue,  3 Mar 2026 05:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mcr1UJjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTkwQ7Bp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB926E6FA
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Mar 2026 05:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515427; cv=none; b=Rno5tGkJfueD4jIWT+4wFm1JyGZdQx8t/toZmzzMKmf8M0lJ1NE5IlLe9y5uT8IjmMsBaB4PUJj6WA8v2fLM307O6Q1T/3kIvC/ohlHO3FkFrpJ3vcFGAYN14lJiPyqGRrgbGzVtTqy23Z7taQBY/G9W/5EHGzvALP/lEx4cO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515427; c=relaxed/simple;
	bh=iDgW2cfd7htMPhuh6EbpJMy7PjdyF+8N2b3YopKk7LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWzh6DHGH+Tm2CvFnQhuau2I+vQYdiaNuVl+kQ3hwZmbcwV7un+S1TCkdnZxTAtq7QxHOV25ocwGS5WPfL3pVmefgFK5Ka+NKey8iVARiF7lNpcGYFKBfaI1lMNyLkiqDBZ3xlGytu9fDcukhYrOAK6I+oBRyIt3F7VUL188cAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mcr1UJjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTkwQ7Bp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6233pCCe1187020
	for <linux-watchdog@vger.kernel.org>; Tue, 3 Mar 2026 05:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DhDvLQeyQlT/AZFrDXorArD2
	6aYKZNcJKOOcuYji5lQ=; b=Mcr1UJjMpdCO9CuPEg9ZHTaf7y9K5m8l1DcNck/F
	BY+uACGfIeNANcQ+Qug5A0j5dbgUKkIK7+wyEVp5oLRuaCwSdqWxvkTM2iF720cs
	oHoOpvc/yMf5/taOtkB6XqL/zffBtP6Wkru3R0Sdf3HlTCS+VTAsVWX+DOiHd1Ca
	x6r1VxPdOHUQllGbtEQvxeXeb0enS7Jc9O2+C1D0svqcoBY1eS3cKPzX/imqrShR
	bPTyhYTFW0/YTxzx8jLcaoQQ+Jq4sW2SiHSvi2p9ugixafK9DTI0CDg3+NpoGQ1u
	eBPfKg5hkmS0V7jfgbug9kZ4xIRQMKdz6Vd7MNb9N2KUyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cng96hr28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:23:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4e20a414so89187405ad.3
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Mar 2026 21:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772515424; x=1773120224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhDvLQeyQlT/AZFrDXorArD26aYKZNcJKOOcuYji5lQ=;
        b=YTkwQ7BpQFRdG+0UIVhGIbrOsc3/2bJnD/MO0ZzVDIfO8hNnLzVeFR5k1eAzZnUeNy
         ZnbFNQzg1ym6UgnsKTI0ddYjkYn4H7PNAu6MrErKkGXEJKK2dy0WxowmBU1O3beszcMn
         ZgfFVb+NU/SuQS8Rc7pi2VKmtZ3rqygAzK4+TRTPr6QZFrMDUDYjJGgmE636MIjyEB3I
         YPhGaufUbSWDOnmCEik56ylRylairEyr8l/av5uImouBC03NYDk94RIOv3/TaHYXWGNy
         ujUuRNh9/84PJmBTyvsIr8a6dXzPAYnkLDrPl2MB2TZMLB+4SefogSx7A/LBWGza1yco
         Ms5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772515424; x=1773120224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhDvLQeyQlT/AZFrDXorArD26aYKZNcJKOOcuYji5lQ=;
        b=ipx4y6IObObjeB308VGXCeVkvjUMNsNNELgACzYaNhUohyQSk3RedFkVBfOVKd9DWG
         hsEuw+k9anINrWebFUzHtmATlf5DZdU+fX/uTJo9oZQazE3/066TUcno2MzNJcg4uZUz
         jmwb72akxL+sMNfIXB/XeAu9B346PoGgat1ppPe1/EmbsEPBL6FyWES2euLBu/zTy8dN
         O0qOy2RPwJj7ANqfE21V+f0kHyKMpVsfTOT7eXPWpyuAGXQyIrPlgYt5mw1bMMSWWKN/
         5kZ9P773ht60miJ0SyR5vM5mpFLIZuNQh2pLpbazGvginK/IB8l2/Zh9ZvRTDcOppHe/
         QzBw==
X-Forwarded-Encrypted: i=1; AJvYcCX/qNOVedcePX2fmFV1frGUWtZJsCqm6YfxdW0WZDHCGYIqG4KBwlX44IhQJ0GH6GGcWilixFjqBm4xH3hkug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5DQsMTSk8khzgehppo2RZwgkvWPohHJnGSWT8MiqjW77CB0P
	fcap6s10Y1GGWe+MFc3lSAwHu/eGzdoy1Hq5IchCBWqVK9npBa4ErDWtpmEquplK12x6fsHHUiw
	Nn6LkjSS9OJNHhjrGRilD9f2F4QLReo9eLs5vRBHzZJ+uniwVxXmX0ZK1T3qF/mlp+ZAxyg==
X-Gm-Gg: ATEYQzzVMvl+xL84pivy9+I/HqllrJj0++XYJJaOXqUF31XerdFpFmCIzx45VyWSeL3
	AB5kjG16V86ys0OQOk6NRnNdVfx3tdKPAyPu9SJKXJZXyzP3crvNjkWW5YFwfFE+7nsTTW6gs8F
	UOwF6VQ238RVzup75KFuAvKVhPZQzGt8DqiMjrwY51ROtav/Fj92uKNAkwX4KGov9jlu+nZVdxy
	DFB32/2xRynLRT6iMPRi+7TDZDggf/a99XUUVwQPXt+VXFxAdTo4CZyxSqwIj4dP6OZtCbGGrYV
	D2IEg/g0l5aBWdWwKRMyNhiHtwIiM8GbPyQicqX85x7A8a7nIbRQPfKkgrDyUtMHio5Meqm0CdZ
	o+LzYQOIes5CHXug896Vz49pdlmo1yYrk1OR/LQmy4JBHjID/yBUgzFI=
X-Received: by 2002:a17:903:1250:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ae2e49855emr131504365ad.27.1772515424058;
        Mon, 02 Mar 2026 21:23:44 -0800 (PST)
X-Received: by 2002:a17:903:1250:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ae2e49855emr131504035ad.27.1772515423606;
        Mon, 02 Mar 2026 21:23:43 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa8302absm14767994a12.29.2026.03.02.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 21:23:43 -0800 (PST)
Date: Tue, 3 Mar 2026 10:53:36 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
Message-ID: <4427f335-bb50-44af-94a5-142d8355a705@quicinc.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <c5a57ab6-ad6c-4228-8ccb-7d7ef306b5b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5a57ab6-ad6c-4228-8ccb-7d7ef306b5b8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Co6ys34D c=1 sm=1 tr=0 ts=69a67061 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=spW7CxkbatQ-H6tlaUEA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3LGp_8iWSvPAvbIpteFdSuiiYH5kV9AV
X-Proofpoint-ORIG-GUID: 3LGp_8iWSvPAvbIpteFdSuiiYH5kV9AV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfX49oS6sEVbB6w
 bQ/HbbZvg32PgsAEfv0oL16Zh95phQNyAkWonJFSdmrAttP8Addj+PQxoJBciZhidQoHj2E5cWv
 AWBdbxpGoW6lmuYsCPNl3exi0Vhq/8G828VlQHFAJiktpN5A8vVPBZhp7zB6TQop3mbUni5FgGj
 lnr6GYIq4wWFOQdRPUr2K8VUJuskOyLuBJxViirdA+SksLdn/lX5QQCBc3Rnmgy6ckN85ERZWSA
 WufUK/Gm9pHtS1WokImAleFxqFyxH0dALq41rQlN0TwPIJKfU5zedHjKYCLYFqyzp4pjjiCm4Vb
 PglPKeBCQpSUSVy7FmSfHENXNpP9JCoi5ka7rE09FMHEbsCogHPW0mfu1MoyLs45tDqOpnuiMjA
 xq5meewrNLxZFpEAK+Z7T9bA0eU/LsNSKW6t6L0I1nWbXwMJ9olMgVT7upcBfGWWTG7Du0Za+ie
 g0Qvab+MPdTJk1EnPIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030033
X-Rspamd-Queue-Id: 438301E9355
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5045-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,quicinc.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bjorn / Wim,

On Tue, Feb 24, 2026 at 02:58:05PM +0530, Pavan Kondeti wrote:
> Hi Bjorn / Wim,
> 
> On Tue, Nov 18, 2025 at 10:40:55AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > Gunyah is a Type-I hypervisor which was introduced in the patch series
> > [1]. It is an open source hypervisor. The source repo is available at
> > [2].
> > 
> > The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> > access the MMIO watchdog. It either provides the fully emulated MMIO
> > based watchdog interface or the SMC-based watchdog interface depending
> > on the hypervisor configuration.
> > The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> > version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> > 
> > This patch series adds support for the SMC-based watchdog interface
> > provided by the Gunyah Hypervisor.
> > 
> > This series is tested on SM8750 platform.
> > 
> > [1]
> > https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
> > 
> > [2]
> > https://github.com/quic/gunyah-hypervisor
> > 
> > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > ---
> > Changes in v8:
> > - Fix error handling in gunyah_wdt_probe() to fail silently with -ENODEV
> >   if WDT_STATUS call returns -EOPNOTSUPP, indicating support for Gunyah
> >   watchdog is not present. Fail with logs for other errors.
> > - Link to v7: https://lore.kernel.org/r/20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com
> > 
> 
> The series applies cleanly on v7.0-rc1. I have tested the watchdog
> driver functionality and ramdumps collection on Kodiak RB3 Gen2
> platform. Can you please pick this series for v7.1?
> 
> As Hrishabh mentioned earlier, both patches don't have any compile time
> dependencies.
> 

Since Hrishabh has left Qualcomm, I am taking over the series. Hence
sending request emails to include this series for v7.0 . I did verify
this on v7.0-rc1 as mentioned above. Since the series applies cleanly, I
have not re-sent the series. However, if you prefer to resend it since a
new person taking over, I can re-send the series with my Signed-off-by.

Please let me know your preference.

Thanks,
Pavan

