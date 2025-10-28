Return-Path: <linux-watchdog+bounces-4440-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C47C160C6
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 18:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0852D356121
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F6B3491D6;
	Tue, 28 Oct 2025 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1fw2rmJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHzq/tmf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323C347FF6
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671261; cv=none; b=hIgC4LS15Ey/O0BrYfws4DvbdXsY7rBDqh1PdV0hEVwNx2MIlSI4I/lRTdvNUaMxDClPaUpJMdA0elUnodNhBxLcUkFIL8G4sORtgA4u/UArAXdxUUk7oqCaqo9CtvdVfSQ+Ht83RmGU+SEgX5SGvquxl6GyekuL2OVojhASsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671261; c=relaxed/simple;
	bh=HR99sC5uZsqVUMBFRelBierRMLcfIMwr4Mda/gA5tLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkmeozzSlMAl6eL6LE7xxkh46jV+URYgM7MYDFHEiCHoMZg7RLWko9oPL0q8QC4UX8XlAW6tSKwaGpzsn+Ry1jswyH1Oo+ikfBaD4XGuRUVxJsvf6bGTef7GvHycJGiLgDEXfbBDLwlNYWlKTEe13ktL/CWp1y+4KIvs7delCOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1fw2rmJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHzq/tmf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEncdi1865808
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 17:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B93WHN0pecu+JdBLsnOgA2E5ylesrRB93++k474f36w=; b=U1fw2rmJxPiAsX0e
	fPld53GvmIDqqsmtnKcmgbh2yWwTfmJoi5MeFtmowMTBT7aCoN8bptdG21zWE1ZY
	WwWGB/thzPWXtngKyscY/r8iUqqg6YUY0IAsyogypR2LR2H4xWL0RP8yY1oiMjkz
	ZDbZOMKVbGrUiqCWcDeKJ/C48mH++6Xmq/bCM8exlMo/W+QjEqgGf6OZ/Q5M5Jd4
	un3rO5g7CEiyFjBWzCVracdDnVVtL3YKe/h9BFKuog9TMPK5lJyGZI3c4KiSjDlL
	O38BkmY9LciKXgY2lxeKdwfhHcfTjHTPl5prYgyLt8J9SGwLYOrhAro4MVN2IwfO
	DlA4AA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2wsprxc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 17:07:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27ee41e062cso70074945ad.1
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761671256; x=1762276056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B93WHN0pecu+JdBLsnOgA2E5ylesrRB93++k474f36w=;
        b=HHzq/tmfuSkDfjph3VmuXRIbuptsyoPBhFhC7+TSDov5m9oTTyp5rG9e3/1mM3oCqv
         1oBPV+9P0C3IgWeDTwIjGgQMS3XEqvppN1x0uoxQnZqUi8o4ykcuoD8dBMizmuFS9Ro1
         kQ2K+7Zl5gxkeZwgTu3+GN7vAV3KfLNSWyqhTn6x8YZKoXnrnAE2ttXBpjvpRJPAt/hP
         Vqg4/HdmRK8f+cF16VQxHeuO0IHR0OYJN/97Y0Ux5THZP5oHwwxm3oDbUhRLydXCPxEe
         EQIZ26FRxtEDiSKFaozjmnNxPuD+j4ard8SYedQ4e3U8Uhjdg71D0p4K9K00c87O0q5Z
         5FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761671256; x=1762276056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B93WHN0pecu+JdBLsnOgA2E5ylesrRB93++k474f36w=;
        b=ZFOwbhfNEFFs2h4VJknXdAnL2FONlmoWC+xw5V8HJbFi5wde+DHo7lEYtthNdbqcQ8
         WLkMzFxCRmA/ZpX3AA7trLfmnJOSiaPwaW9uni0CB63gl4HV0Nf8Pv4TspgLUHtN6xm8
         E+dmZuZy/iICHWRhclOrSQNqMGfUELsfTdw8FNEBqUxw+JvhpEl+1QjPxbOA1b1vv0Qi
         TAWhIXlaB4n2dnBi9WOcXpYpbwbSK71xGb9cSTNr99Phw+r5I6ZaQNEQIuQco3fTunDv
         YJ898RXNORzPWyjnYM3rTRntUohWdwMDQhcA50xqoTXlr/HfZ5LmH3qHrfcni3ijcssA
         2xAA==
X-Forwarded-Encrypted: i=1; AJvYcCVj3sZq/VAy0OasYkXawQpwqbrN/wA01C7yQem/e6nOsCSy6Xo+Mpn+NjAUwFU0R8Bm2CybYX8VOy75gd16Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzQdVjDUMDcLNMIiV4UofmbTyYi8g8MY9kWmSlaf60DLXkCRr
	P3VwSt3rOK1OZOlE3vpWQwBtod3v8Sr64c0mhFn0RmPAgN3wGtaQkjikZHwRELR3AdlFF5hgQfM
	NuCLpAle12GvuQVTWKpG5a3/LaBxbzvwspWyl3s1+0/YTarlLfnzQyQ4VyrPISJM31P3BrtbJaO
	tDjsw3
X-Gm-Gg: ASbGncvL3FNL/T4/c9KqTLS8R3xR2H6wmik11CK48EhNSw9ePTosMPJBJub3aOPsPzD
	8v/9tuGtXJVBwQ2ZjK8E/RPd9LsIxhK9F6dyT6Ju53/boYoODh9+Fv23lbcNyAED2Vqd5mu0cJp
	GDPGY8i/930eP6iY1oPF6WH34qiex+ZxMquO4yQDYtOSxZJqk65aGAAAn1I5yCdGmb1ViG0pLHo
	JhVPRoikxVUYgokCwWXbc1f696uJ16kZMom2wQ/3uvbgwFHWokhIP/UD1WcotihZVNB56z1w2uJ
	8gitL7z7MPOQPJzHd+juPVBGZgDAn2DNGnI0ZvJTIQIXq9WPWCa66i7B+d7BPmYMLLJrgZTqTE8
	AsgjYyBq1IeodBeoQM4QaittnkFFBB4nl
X-Received: by 2002:a17:903:2348:b0:262:661d:eb1d with SMTP id d9443c01a7336-294cb35eba5mr52386275ad.1.1761671255754;
        Tue, 28 Oct 2025 10:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgukZAvE035BJqYz+pZ5F4IyB2vUki1IRZC6Y+wRVNhxAKQ7bAKZu4Xe6sQ6wpAv1G9+cGig==
X-Received: by 2002:a17:903:2348:b0:262:661d:eb1d with SMTP id d9443c01a7336-294cb35eba5mr52385755ad.1.1761671254865;
        Tue, 28 Oct 2025 10:07:34 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128e41c01sm10882800a12.23.2025.10.28.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:07:34 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:37:27 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
Message-ID: <5a2e8f14-90bb-4487-9c4a-b595218b817e@quicinc.com>
References: <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
 <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
 <59a00934-cb42-43de-ac5b-a9292b08301d@quicinc.com>
 <aa4faa81-6e9d-41c2-85f0-32045a8f9f51@kernel.org>
 <jaj5oxqcgckndtp7wwe6ukqbh4z5phe3pw3hnhp2hatgqffjzr@y7qevil4o3yr>
 <aba2bf95-836e-444d-961d-0b2ac1fb415a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aba2bf95-836e-444d-961d-0b2ac1fb415a@kernel.org>
X-Proofpoint-GUID: tGT2fKmgW1ykqdt_5WZ3gmConB2gHeEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0NSBTYWx0ZWRfX/vLIutNXFNpd
 9qk8M9d06MTAvpa4jfAawLsdQY6+c7Vhx4BG65Ww6efW68sQnxnUhlN3v29XgHD+wkC6Xy7WS0v
 9QewWislZw1hqphHUDwDV3wx0h7doZsLcAQg2DVmWVJ/1vMI3h0x4L1QQBmYHqa84aTApFZt7oW
 KirYnCk8iOzPsjgdMrdahqhNSLm/D3hfQScd/aDkLwQS6Iy76gt/LbZOlwOhTXH4/WTmD04TRSj
 Nw62YlAO8yynWVC6aiRclewcjoaBYrCYCXWxEmSL91HNeWfIZvRUc81a0h4Ff36fWRPdWUxxRBJ
 xpejYE1tFGUS5VIoelp6yRfpR6yIi9/nB5woSP2wCBO1obe/yXJ8ub7IBlw/9436+cOVcUBj/zS
 Yd/MMKn2jNipXAvy9B/j0vC47WUTEQ==
X-Authority-Analysis: v=2.4 cv=aIj9aL9m c=1 sm=1 tr=0 ts=6900f859 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=cz7308oxQqenTtKe3SgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: tGT2fKmgW1ykqdt_5WZ3gmConB2gHeEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280145

On Tue, Oct 28, 2025 at 05:53:23PM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2025 17:51, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 05:40:33PM +0100, Krzysztof Kozlowski wrote:
> >> On 28/10/2025 17:33, Pavan Kondeti wrote:
> >>> On Tue, Oct 28, 2025 at 05:17:44PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 28/10/2025 13:27, Pavan Kondeti wrote:
> >>>>> On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
> >>>>>>> On 28/10/2025 11:58, Hrishabh Rajput wrote:
> >>>>>>>>
> >>>>>>>> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
> >>>>>>>>>> +
> >>>>>>>>>> +static int __init gunyah_wdt_init(void)
> >>>>>>>>>> +{
> >>>>>>>>>> +	struct arm_smccc_res res;
> >>>>>>>>>> +	struct device_node *np;
> >>>>>>>>>> +	int ret;
> >>>>>>>>>> +
> >>>>>>>>>> +	/* Check if we're running on a Qualcomm device */
> >>>>>>>>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> >>>>>>>>> I don't think you implemented my feedback. This again is executed on
> >>>>>>>>> every platform, e.g. on Samsung, pointlessly.
> >>>>>>>>>
> >>>>>>>>> Implement previous feedback.
> >>>>>>>>
> >>>>>>>> Do you want us to add platform device from another driver which is 
> >>>>>>>> probed only on Qualcomm devices (like socinfo from previous discussion) 
> >>>>>>>> and get rid of the module init function entirely? As keeping anything in 
> >>>>>>>> the module init will get it executed on all platforms.
> >>>>>>>
> >>>>>>> Instead of asking the same can you read previous discussion? What is
> >>>>>>> unclear here:
> >>>>>>> https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
> >>>>>>> ?
> >>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> With this patch version, we have tried to reduce the code execution on 
> >>>>>>>> non-Qualcomm devices (also tried the alternative as mentioned in the 
> >>>>>>>> cover letter). Adding platform device from another driver as described 
> >>>>>>>> above would eliminate it entirely, please let us know if you want us to 
> >>>>>>>> do that.
> >>>>>>>
> >>>>>>> Why do I need to repeat the same as last time?
> >>>>>>
> >>>>>>
> >>>>>> Now I see that you completely ignored previous discussion and sent THE
> >>>>>> SAME approach.
> >>>>>
> >>>>> Our intention is not to waste reviewers time at all. It is just a
> >>>>> misunderstanding on what your comment is about. Let me elaborate further
> >>>>> not to defend our approach here but to get a clarity so that we don't
> >>>>> end up in the same situation when v4 is posted.
> >>>>>
> >>>>> https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/ 
> >>>>>
> >>>>> You mentioned here
> >>>>>
> >>>>> ```
> >>>>> To me socinfo feels even better. That way only, really only qcom devices
> >>>>> will execute this SMC.
> >>>>> ```
> >>>>>
> >>>>> We interpreted this comment as `avoid executing this SMC on non qcom
> >>>>> devices`. That is exactly what we have done in the current patch. since
> >>>>
> >>>>
> >>>> So where did you use socinfo? Point me to the code.
> >>>>
> >>>
> >>> Okay, lets go a bit deep into the socinfo part. we have used
> >>> `soc_device_match()` API to detect if the device is qcom (`family =
> >>> Snapdragon`). It works. However, when we built both `socinfo` and
> >>
> >> socinfo driver. Read my first feedback:
> >>
> >>
> >> "No, your hypervisor driver (which you have) should start the module via
> >> adding platform/aux/something devices."
> >>
> >> And then I agreed if you start it from the socinfo driver.
> > 
> > I'd rather not tie this to socinfo. The socinfo is an optional driver,
> > which is mainly used to provide debugfs entries. Watchdog is much more
> > important. It should not be tied to debugfs-only entry.
> > 
> 
> No problem. Choose whatever driver it is. The problem is that they did
> not even implement that. They claimed they followed review but it is
> 100% ignored. Nothing got implemented and they send the same.
> 

We will register the wdt platform device from smem driver something like
below. This makes this gunyah-wdt driver to register for a platform
driver which gets probed only on qcom devices.

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4..67bf5f075cb8 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1236,6 +1236,8 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	register_hyp_wdt_after_other_dt_checks();
+
 	return 0;
 }
 
Thanks,
Pavan

